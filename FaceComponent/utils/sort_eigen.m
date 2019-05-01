function [Sorted_Vectors, Sorted_Values] = sort_eigen(Vectors, Values)
%EIGEN_SORT Summary of this function goes here
%   Detailed explanation goes here

diagonal_values = diag(Values);
Sorted_Vectors = zeros(size(Vectors));
[~, index] = sort(diagonal_values);
index = flipud(index);

for i = 1:size(Values,1)
  Sorted_Values(i,i) = Values(index(i),index(i));
  Sorted_Vectors(:,i) = Vectors(:,index(i));
end