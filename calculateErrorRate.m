function errorRate = calculateErrorRate(confMatrix)
    % This function calculates the error rate from a confusion matrix.
    % 
    % Inputs:
    %   confMatrix: NxN matrix where N is the number of classes.
    %               Diagonal elements represent correct predictions,
    %               and off-diagonal elements represent misclassifications.
    %
    % Outputs:
    %   errorRate: The proportion of all predictions that were incorrect.

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
