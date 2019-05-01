% Analysis
image_width = 280;
image_height = 320;

% Paths
define_globals(pwd);

% Read candidate data
candidates_data = read_data(image_width, image_height);

% Distances between candidate each eye
distance_results = [];
cached_file_name = [pwd '/distance_between_candidate_each_eye.mat'];

if exist(cached_file_name, 'file')
    load(cached_file_name);
else

    % Calculate distance between candidate each eye
    for i = 1:size(candidates_data, 2)

        for ii = 1:size(candidates_data{i})

            % First eye image
            candidate_eye_image = reshape(candidates_data{i}(ii, :), image_width, image_height);
            image_name = ['candidate_' int2str(i) '_' int2str(ii)];

            % Extract iris template
            [first_template, first_mask] = extract_template( candidate_eye_image, image_name );

            for jj = 1:size(candidates_data{i})

                % Second eye image
                candidate_eye_image = reshape(candidates_data{i}(jj, :), image_width, image_height);
                image_name = ['candidate_' int2str(i) '_' int2str(jj)];

                % Extract iris template
                [second_template, second_mask] = extract_template( candidate_eye_image, image_name );

                % Hamming distance
                [ distance ] = hamming_distance( first_template, first_mask, second_template, second_mask, 1 );
                distance_results{i}(ii, jj) = distance;

            end

        end

        % Replace same iris distance results with mean distance result
        distance_results{i}(distance_results{i} == 0) = sum(distance_results{i}) ./ size(distance_results{i}, 1);
        
        % Save calculated data to file cache
        save(cached_file_name, 'distance_results');
        
        fprintf(strcat('\nCandidate ', int2str(i), ' is done'));
    end

end

% Distances between each candidate, one vs all (Takes one image from candidate
% and compares rest of image agains all others)
distance_results = [];
training_image_index = 1;
cached_file_name = strcat(pwd, '/one_vs_all_distance_calculation.mat');

if exist(cached_file_name, 'file')
    load(cached_file_name);
else

    for i = 1:size(candidates_data, 2)
        
        fprintf(strcat('\nStart one vs all against Candidate ', int2str(i)));

        % First eye image
        candidate_eye_image = reshape(candidates_data{i}(training_image_index, :), image_width, image_height);
        image_name = ['candidate_' int2str(i) '_' int2str(training_image_index)];

        % Extract iris template
        [first_template, first_mask] = extract_template( candidate_eye_image, image_name );

        % Loop over all candidate for one vs all mesurments
        for j = 1:size(candidates_data, 2)

            for jj = 1:size(candidates_data{j})

                % Second eye image
                candidate_eye_image = reshape(candidates_data{j}(jj, :), image_width, image_height);
                image_name = ['candidate_' int2str(j) '_' int2str(jj)];

                % Extract iris template
                [second_template, second_mask] = extract_template( candidate_eye_image, image_name );

                % Hamming distance
                [ distance ] = hamming_distance( first_template, first_mask, second_template, second_mask, 1 );
                distance_results{i, j}(training_image_index, jj) = distance;

            end

            fprintf(strcat('\n\tCandidate ', int2str(i), ' against Candidate ', int2str(j), ' is DONE.'));

        end

        fprintf(strcat('\nCandidate ', int2str(i), ' is fully done.'));
        % break;
        
    end
    
    % Save calculated data to file cache
    save(cached_file_name, 'distance_results');
    
    fprintf('\nOne vs All is successfully DONE.\n');

end


% Calculate precision by multiple thresholds
far_frr_by_thresh_results = [];
cached_file_name = strcat(pwd, '/far_frr_by_thresh_results.mat');

for thresh = 0.19:0.005:0.5
    
    TP = 0;
    FN = 0;
    TN = 0;
    FP = 0;
    
    % Loop over each authentification candidate
    for i = 1:size(candidates_data, 2)

        % Loop over rest candidates
        for j = 1:size(candidates_data, 2)

            for jj = 1:size(candidates_data{j})

                 distance = distance_results{i, j}(training_image_index, jj);

                 if distance < thresh
                     if i == j
                        TP = TP + 1; 
                     else
                        FP = FP + 1; 
                     end
                 else
                    if i == j
                        FN = FN + 1; 
                     else
                        TN = TN + 1; 
                     end
                 end

            end

        end

    end

    % Final FAR and FRR for current threshold
    FAR = (FP ./ (FP + TN)) .* 100;
    FRR = (FN ./ (FN + TP)) .* 100;
    
    far_frr_by_thresh_results = [far_frr_by_thresh_results; thresh FAR FRR];
    save(cached_file_name, 'far_frr_by_thresh_results');
    
end
