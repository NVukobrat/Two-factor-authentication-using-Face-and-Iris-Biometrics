% Predefining
define_globals();

% Globals
global CACHE_PATH;
global TRAIN_INDEX;
global TRAIN_TEST_SPLIT_SCALE;
global FACES_PER_CANDIDATE;

% Read face and iris data
[ candidate_faces ] = read_face_data();
[ candidate_irises ] = read_iris_data();

% Extract face train and test signatures
[ face_signatures_train, face_signatures_test ] = extract_face_signatures( candidate_faces );

% Classification 
cached_file_name = [CACHE_PATH '/iris_distance_results.mat'];

if exist(cached_file_name, 'file')
    load(cached_file_name);
else
    % Loop over ONE
    for i = 1:size(candidate_irises, 2)
        
        fprintf(1, '\nCandidate %d started - ONE', i);
       
        % Extract iris train template
        TRAIN_INDEX = 1;
        iris_train_eye = candidate_irises{i}(TRAIN_INDEX, :);
        iris_cache_image_name = ['candidate_' int2str(i) '_' int2str(TRAIN_INDEX)];

        [ iris_train_template, iris_train_mask ] = extract_iris_template( iris_train_eye, iris_cache_image_name );
    
        % Loop over ALL
        for j = 1:size(candidate_irises, 2)

            for jj = 1:size(candidate_irises{j}, 1)

                % Extract iris test template
                iris_test_eye = candidate_irises{j}(jj, :);
                iris_cache_image_name = ['candidate_' int2str(j) '_' int2str(jj)];

                [ iris_test_template, iris_test_mask ] = extract_iris_template( iris_test_eye, iris_cache_image_name );

                % Calculate distance
                [ distance ] = calculate_iris_distance( iris_train_template, iris_train_mask, iris_test_template, iris_test_mask );
                iris_distance_results{i, j}(TRAIN_INDEX, jj) = distance;
            end
            
            fprintf(1, '\n\tCandidate %d finished - ALL', j);

        end
        
        fprintf(1, '\nCandidate %d finished - ONE', i);
        
    end
    
    % Save iris distance to cache
    save(cached_file_name, 'iris_distance_results');
   
end

% Calculate precision by multiple thresholds
cached_file_name = [CACHE_PATH '/far_frr_by_thresh_results.mat'];

if exist(cached_file_name, 'file')
    load(cached_file_name);
else

    far_frr_by_thresh_results = [];
    
    for threshold = 0.19:0.005:0.5

    TP = 0;
    FN = 0;
    TN = 0;
    FP = 0;

        % Loop candidates
        for i_i = 1:size(candidate_irises, 2)

            % Loop face
            for i_f = 1:size(face_signatures_test, 1)

                % Closest matching face
                [~, ii_f] = min(face_signatures_test(i_f, :));

                % Get candidate name
                face_candidate_real_class = ceil((i_f / (1 - TRAIN_TEST_SPLIT_SCALE)) / FACES_PER_CANDIDATE);
                face_candidate_guess_class = ceil((ii_f / TRAIN_TEST_SPLIT_SCALE) / FACES_PER_CANDIDATE);

                % Loop iris
                for j_i = 1:size(candidate_irises, 2)

                    for jj = 1:size(candidate_irises{j_i}, 1)

                         distance = iris_distance_results{i_i, j_i}(TRAIN_INDEX, jj);

                         % Check
                         if (distance < threshold) && (face_candidate_real_class == face_candidate_guess_class)
                             if i_i == j_i
                                TP = TP + 1; 
                             else
                                FP = FP + 1; 
                             end
                         else
                            if i_i == j_i
                                FN = FN + 1; 
                             else
                                TN = TN + 1; 
                             end
                         end

                    end

                end
            end

        end

        FAR = (FP ./ (FP + TN)) .* 100;
        FRR = (FN ./ (FN + TP)) .* 100;   

        far_frr_by_thresh_results = [far_frr_by_thresh_results; threshold FAR FRR];

    end

    save(cached_file_name, 'far_frr_by_thresh_results');

end
