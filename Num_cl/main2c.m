tic;
% KNN
K = 7;
key = cell(10,1);
k = 1;
test_chunk = testv(1000*(k-1) + 1:k*1000, :);

distances = pdist2(test_chunk, trainv);


% Ranking the classes based on which is nearest
[~, minIndices] = min(distances, [], 2);
nearest_classes = trainlab(minIndices);

[sortedValues, sortedIndices] = sort(distances, 2, 'ascend');

smallestKIndices = sortedIndices(:, 1:K);

K_nearest_classes = trainlab(smallestKIndices);
KNN_nearest_class = zeros(1000,1);

dups = zeros(1000, 1);

for row = 1:size(smallestKIndices, 1)
    class_apps = zeros(10,1);
    for col = 1:size(smallestKIndices, 2)
        apps_index = K_nearest_classes(row, col) + 1;
        class_apps(apps_index) = class_apps(apps_index) + 1;
    end
    
    [~, maxIndex] = max(class_apps);
    %most_frequent_class = most_frequent_class - 1;
    
    % Find the unique numbers and their first occurrence index
    [uniqueValues, ~, ic] = unique(class_apps);

    % Count the occurrences of each unique number
    counts = histcounts(ic, 1:max(ic)+1); 
    
    % Find numbers that occur more than once
    duplicates = uniqueValues(counts > 1);
    
    % Get indices of the duplicates
    duplicateIndices = find(ismember(class_apps, duplicates));
    
    % Setting the nearest class to the one with majority of neares
    % templates
    KNN_nearest_class(row) = maxIndex - 1;
    
    % Checking for duplicates among the most frequent
    % If duplicates, the nearest class is added to answer matrix
    % The if statement is never (almost)entered, but it does add
    % around 6 seconds to the runtime

    counter = 0;
    if ismember(maxIndex, duplicateIndices)
        counter = counter + 1;
        for col = 1:7
            sortedClass = trainlab(sortedIndices);
            if ismember(sortedClass(col) + 1, duplicateIndices) && sortedClass(col) == maxIndex - 1;
                KNN_nearest_class(row) = sortedClass(col);
                break
            end
        end
        
    end
    dups(row) = counter;
   
end

conf_matrix = confusionMatrix(KNN_nearest_class, testlab(1:1000));
error_rate = calculateErrorRate(conf_matrix);
misclassifications = find(KNN_nearest_class ~= testlab(1:1000, :));

misclassified_img = zeros(28,28); misclassified_img(:)= testv(1,:);
%misclassified_img2 = zeros(28,28); misclassified_img(:)= testv(1,:);
image(misclassified_img);

toc;
% Elapsed time about 7.4 seconds
