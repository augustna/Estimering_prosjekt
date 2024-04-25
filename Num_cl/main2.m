k = 1;
test_chunk = testv(1000*(k-1) + 1:k*1000, :);

% Clustering
M = 64;
tic;
group = groupMatrixRowsByVector(trainv, trainlab);
% C_i contains clustered data


% Finding

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
toc;
% Elapsed time about 12.1158943 seconds
