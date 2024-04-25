
function weightedPosMean = weightedPosMeanOld(data_matrix)
    max_weight = 255;
    weightedPosMean = zeros(size(data_matrix, 1), 1);
    for row = 1:size(data_matrix, 1)
        row_sum = 0;
        n_larger_than_zero = 0;
        for col = 1:size(data_matrix, 2)
            row_sum = row_sum + data_matrix(row, col)*col;
            if data_matrix(row, col) > 0
                n_larger_than_zero = n_larger_than_zero + 1;
            end
        end
        weightedPosMean(row) = row_sum/(n_larger_than_zero * max_weight);
    end

end