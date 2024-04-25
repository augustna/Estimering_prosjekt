function groupedRows = groupMatrixRowsByVector(matrix, vector)
    % This function groups rows from 'matrix' based on the categories specified in 'vector'.
    % The output 'groupedRows' is a cell array, where each cell contains rows of 'matrix' that correspond to the same category in 'vector'.
    
    % Ensure vector is a column vector
    if size(vector, 2) ~= 1
        error('The vector must be an Nx1 column vector.');
    end
    
    % Unique categories in the vector
    categories = unique(vector);
    
    % Initialize cell array to hold the grouped rows
    groupedRows = cell(length(categories), 1);
    
    % Group rows based on the vector
    for i = 1:length(categories)
        category = categories(i);
        % Find rows where the vector equals the current category
        rowIndexes = find(vector == category);
        % Extract these rows and store in the corresponding cell
        groupedRows{i} = matrix(rowIndexes, :);
    end
end
