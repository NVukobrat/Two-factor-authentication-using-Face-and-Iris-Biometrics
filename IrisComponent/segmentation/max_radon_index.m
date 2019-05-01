function max_value_indexes = max_radon_index( R, indexes )
%MAX_RADON_INDEX Summary of this function goes here
%   Detailed explanation goes here


[~, ind] = sort(-R(indexes));
max_value_index_num = size(indexes, 1);
max_value_indexes = indexes(ind(1:max_value_index_num));

end

