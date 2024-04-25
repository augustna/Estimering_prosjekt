function groupedRows = groupMatrixRowsByClass(matrix, classVector)
    % This function groups rows from 'matrix' based on the classes specified in 'classVector'.
    % The output 'groupedRows' is a cell array, where each cell contains rows of 'matrix' that correspond to the same class in 'classVector'.
    
    % Check if the length of classVector matches the number of rows in the matrix
    if size(matrix, 1) ~= length(classVector)
        error('The length of classVector must match the number of rows in matrix.');
    end
    
    % Find unique classes and their order of appearance
    [uniqueClasses, ~, ic] = unique(classVector);
    
    % Initialize the cell array to hold the grouped rows
    groupedRows = cell(length(uniqueClasses), 1);
    
    % Group rows based on the class labels
    for i = 1:length(uniqueClasses)
        % Find rows where classVector equals the current class
        classRows = matrix(ic == i, :);
        % Store these rows in the corresponding cell
        groupedRows{i} = classRows;
    end
end
