function cmatrix = confusionMatrix(predicted, trueLabels)
    % Validate the input sizes
    if length(predicted) ~= length(trueLabels)
        error('The length of predicted labels and true labels must be the same.');
    end
    % Extract unique classes from the true labels
    numClasses = 10;

    % Initialize the confusion matrix
    cmatrix = zeros(numClasses);
    % Map classes to indices for matrix placement
    [~, ~, predIndices] = unique(predicted);
    [~, ~, trueIndices] = unique(trueLabels);
    % Fill the confusion matrix
    for i = 1:length(trueLabels)
        cmatrix(trueIndices(i), predIndices(i)) = cmatrix(trueIndices(i), predIndices(i)) + 1;
    end
end