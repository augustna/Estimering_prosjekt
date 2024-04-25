tic;

key = cell(10,1);
k = 1;
test_chunk = testv(1000*(k-1) + 1:k*1000, :);

distances = pdist2(test_chunk, trainv);

[~, colIndices] = min(distances, [], 2);

key{k} = trainlab(colIndices);

conf_matrix = confusionMatrix(key{1}, testlab(1:1000));
error_rate = calculateErrorRate(conf_matrix);


misclassifications = find(key{1} ~= testlab(1:1000, :));

misclassified_img = zeros(28,28); misclassified_img(:)= testv(1,:);
misclassified_img2 = zeros(28,28); misclassified_img(:)= testv(1,:);

toc;
% Elapsed time about 7.4 seconds

