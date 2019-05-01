function [ candidate_irises ] = read_iris_data()
%READ_IRIS_DATA Summary of this function goes here
%   Detailed explanation goes here

global ROOT;
global IRIS_COMPONENT_PATH;
global IRIS_WIDTH;
global IRIS_HEIGHT;

cd(IRIS_COMPONENT_PATH);
candidate_irises = read_data(IRIS_WIDTH, IRIS_HEIGHT);
cd(ROOT);

end

