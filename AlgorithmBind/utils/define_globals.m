function define_globals()
%DEFINE_GLOBALS Summary of this function goes here
%   Detailed explanation goes here

% General globals
global ROOT;
global ALGORITHM_BIND_PATH;
global CANDIDATE_NUM;
global CACHE_PATH;

ROOT = pwd;
ALGORITHM_BIND_PATH = [ROOT '/AlgorithmBind'];
CANDIDATE_NUM = 40;
CACHE_PATH = [ALGORITHM_BIND_PATH '/cache'];

% Iris globals
global IRIS_COMPONENT_PATH;
global IRIS_WIDTH;
global IRIS_HEIGHT;
global IRIS_DIAG;
global TRAIN_INDEX;

IRIS_COMPONENT_PATH = [ROOT '/IrisComponent'];
IRIS_WIDTH = 280;
IRIS_HEIGHT = 320;
IRIS_DIAG = [IRIS_COMPONENT_PATH '/diagnostics/'];
TRAIN_INDEX = 1;

% Face globals
global FACE_COMPONENT_PATH;
global EIGEN_VEC_NUM;
global TRAIN_TEST_SPLIT_SCALE;
global FACES_PER_CANDIDATE;

FACE_COMPONENT_PATH = [ROOT '/FaceComponent'];
EIGEN_VEC_NUM = 10;
TRAIN_TEST_SPLIT_SCALE = 0.7;
FACES_PER_CANDIDATE = 10;

end

