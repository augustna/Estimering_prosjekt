function groupedRows = groupMatrixRowsByVector(matrix, vector)
    if size(vector, 2) ~= 1
        error('The vector must be an Nx1 column vector.');
    end
   
    categories = unique(vector);
    groupedRows = cell(length(categories), 1);
    
    for i = 1:length(categories)
        category = categories(i);
        rowIndexes = find(vector == category);
        groupedRows{i} = matrix(rowIndexes, :);
    end
end
