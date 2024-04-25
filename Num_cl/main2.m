% Clustering
M = 64;
group = groupMatrixRowsByVector(trainv, trainlab);
% C_i contains clustered data
[idx_i, C_i] = kmeans(group{1}, M);

% Finding

for i 
distances_clustered = pdist2(test_chunk, C_i);