function errorRate = calculateErrorRate(confMatrix)
    if size(confMatrix, 1) ~= size(confMatrix, 2)
        error('The confusion matrix must be square.');
    end
    
    totalPredictions = sum(confMatrix(:));
    correctPredictions = sum(diag(confMatrix));
    incorrectPredictions = totalPredictions - correctPredictions;
    
    errorRate = incorrectPredictions / totalPredictions;
end
