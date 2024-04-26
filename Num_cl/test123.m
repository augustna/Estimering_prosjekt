    
class_apps = [1, 3, 3, 1, 0, 1, 0, 0, 0, 0];

[~, maxIndex] = max(class_apps);
%most_frequent_class = most_frequent_class - 1;

% Find the unique numbers and their first occurrence index
[uniqueValues, ~, ic] = unique(class_apps);

% Count the occurrences of each unique number
counts = histcounts(ic, 1:max(ic)+1); 

% Find numbers that occur more than once
duplicates = uniqueValues(counts > 1);