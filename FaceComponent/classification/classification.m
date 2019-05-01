% Configuration
W = 112;
H = 92;
number_of_vectors = 10;

% Reads all candidates data
candidate_data = read_candidate_data();

% Split data to train and test - PRECISION IS NOT CORRECT AT: 0.8, 0.9
split_scale = 0.7;
[ train_data, test_data ] = train_test_split( candidate_data, split_scale);

% Read all train faces in one matrix
[ train_faces ] = train_into_matrix( train_data, split_scale );

% Mean train face
mean_train_face = mean(train_faces, 2);

% Calculate normalized train faces
normalized_train_faces = train_faces - mean_train_face;

% Compute eigen vectors and values
[Vectors, Values, mean_face] = compute_eigenvectors(train_faces, number_of_vectors);

% Train signatures - each row is signature for one image
[ signatures_train ] = train_signatures( train_faces, number_of_vectors, normalized_train_faces, Vectors );

% Read all test faces in one matrix
[ test_faces ] = test_into_matrix( test_data, split_scale );

% Test signatures
[ signature_test ] = test_signatures( test_faces, mean_train_face, Vectors, train_faces, signatures_train );

% Classification
[ precission ] = calculate_precision( signature_test, split_scale );

% Results
fprintf(1, '\nClassification precision is %0.2f%%\n', precission);
