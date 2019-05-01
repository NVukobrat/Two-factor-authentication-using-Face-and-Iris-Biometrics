function [polar_array, polar_noise, xo, yo] = normalise_iris( image, iris_coords, pupil_coords )
%NORMALISE_IRIS Summary of this function goes here
%   Detailed explanation goes here

% Configuration
radial_step = 20;
angular_step = 240;

% Cacluate displacement of pupil and iris center
[ ox, oy ] = displacement_of_centers( iris_coords, pupil_coords );

% Calculate alpha and beta angles for remaping function which rescales points
% depending of the angles around the circe
[ alpha, beta ] = alpha_beta_for_remapping( ox, oy, angular_step );

% Calculate radius between pupil and iris as a function of the angle
[ r ] = radius_between_iris_pupil( alpha, beta, iris_coords, pupil_coords );

% Create iris/pupil radius matrix
[ radius_mat ] = radius_matrix( r, radial_step, angular_step, pupil_coords );

% Calculate cartesian coordinates 
[ xo, yo ] = cartesian_coordinates( angular_step, radial_step, radius_mat, pupil_coords );

% Extract intensity values into the normalised polar representation through
% interpolation
[ polar_array ] = polar_representation( image, xo, yo );

% Create noise array with location of NaNs in polar_array
[ polar_noise ] = polar_noise_extraction( polar_array );

% Replace NaN for performing the future encoding phase
[ polar_array ] = future_encoding_cleaning( polar_array );

% Get rid of outlining points
[ xo, yo ] = diagnostic_cleaning( image, xo, yo );

end