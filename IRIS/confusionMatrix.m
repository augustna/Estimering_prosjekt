function cmatrix = confusionMatrix(predicted, trueLabels)
    if length(predicted) ~= length(trueLabels)
        error('The length of predicted labels and true labels must be the same.');
    end
    
    numClasses = 3;
    cmatrix = zeros(numClasses);

    [~, ~, predIndices] = unique(predicted);
    [~, ~, trueIndices] = unique(trueLabels);

    for i = 1:length(trueLabels)
        cmatrix(trueIndices(i), predIndices(i)) = cmatrix(trueIndices(i), predIndices(i)) + 1;
    end
end
