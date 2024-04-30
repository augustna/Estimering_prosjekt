function errorRate = calculateErrorRate(confMatrix)
    % Validate input is a square matrix
    if size(confMatrix, 1) ~= size(confMatrix, 2)
        error('The confusion matrix must be square.');
    end
    % Total number of predictions
    totalPredictions = sum(confMatrix(:));
    
    % Correct predictions are the sum of the diagonal elements
    correctPredictions = sum(diag(confMatrix));
    
    % Incorrect predictions are total minus correct
    incorrectPredictions = totalPredictions - correctPredictions;
    
    % Calculate error rate
    errorRate = incorrectPredictions / totalPredictions;
end