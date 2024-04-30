k = 1;
test_chunk = testv(1000*(k-1) + 1:k*1000, :);
% Clustering
M = 64;
group = groupMatrixRowsByVector(trainv, trainlab);
% Iterating through each class
% For each class checking if the current class cluster is nearer the sample
% than the nearest this far
% If the sample is nearer the current class than the one in nearest class,
% current_min is updated and nearest_class is updated
for class = 1:10
    [idx_i, C_i] = kmeans(group{class}, M);
    distances_clustered = pdist2(test_chunk, C_i);
    [class_min, colIndices] = min(distances_clustered, [], 2);    
    if class == 1 
       nearest_class = ones(1000, 1);
       current_min = class_min;
    end
    for row = 1:1000
        if class_min(row) < current_min(row)
            current_min(row) = class_min(row);
            nearest_class(row) = class;
        end
    end
end
conf_matrix_clustered = confusionMatrix(nearest_class, testlab(1:1000));
error_rate = calculateErrorRate(conf_matrix_clustered);

% Create a confusion chart
figure;
confChart = confusionchart(conf_matrix_clustered, 'RowSummary','row-normalized', 'ColumnSummary','column-normalized');

% Set titles and labels as needed
title('Confusion Matrix');
confChart.RowSummary = 'row-normalized';  % Normalize by row to show row-wise percentages
confChart.ColumnSummary = 'column-normalized';  % Normalize by column to show column-wise percentages

% Elapsed time about 12.1158943 seconds