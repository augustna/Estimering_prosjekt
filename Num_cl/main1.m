tic;
key = cell(10,1);

test_chunk = testv(1:1000, :);

distances = pdist2(test_chunk, trainv);

[~, colIndices] = min(distances, [], 2);

test_results = trainlab(colIndices);

conf_matrix = confusionMatrix(test_results, testlab(1:1000));
error_rate = calculateErrorRate(conf_matrix);

misclassifications = find(test_results ~= testlab(1:1000, :));

misclassified_img = zeros(28,28); misclassified_img(:)= testv(misclassifications(3),:);

rotated = rot90(misclassified_img, -1);
flipped = flip(rotated, 2);
image(flipped);

%{
% Create a confusion chart
figure;
confChart = confusionchart(conf_matrix, 'RowSummary','row-normalized', 'ColumnSummary','column-normalized');

% Set titles and labels as needed
title('Confusion Matrix');
confChart.RowSummary = 'row-normalized';  % Normalize by row to show row-wise percentages
confChart.ColumnSummary = 'column-normalized';  % Normalize by column to show column-wise percentages
%}
toc;
% Elapsed time about 7.4 seconds

