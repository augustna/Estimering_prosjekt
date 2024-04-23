%{
function plotClassFeatureHistograms(dataMatrix)
    % This function plots histograms for each feature, grouped by class.
    % The dataMatrix is a 3*N x n_features matrix where:
    %   - The first N rows are class 1,
    %   - The next N rows are class 2,
    %   - The last N rows are class 3.

    % Validate input
    if size(dataMatrix, 1) < 3
        error('Data matrix must have at least 3 rows.');
    end
    
    if mod(size(dataMatrix, 1), 3) ~= 0
        error('Number of rows in data matrix must be a multiple of 3.');
    end
    
    N = size(dataMatrix, 1) / 3;  % Number of samples per class
    numFeatures = size(dataMatrix, 2);  % Number of features
    
    % Split data by class
    class1Data = dataMatrix(1:N, :);
    class2Data = dataMatrix(N+1:2*N, :);
    class3Data = dataMatrix(2*N+1:end, :);

    % Define class names (optional)
    classNames = {'Class 1', 'Class 2', 'Class 3'};
    
    % Create a figure with subplots for each feature
    figure;
    for i = 1:numFeatures
        subplot(numFeatures, 1, i);
        hold on;
        % Histogram for Class 1
        histogram(class1Data(:, i), 'BinWidth', 0.1, 'DisplayName', classNames{1}, 'FaceAlpha', 0.5);

        % Histogram for Class 2
        histogram(class2Data(:, i), 'BinWidth', 0.1, 'DisplayName', classNames{2}, 'FaceAlpha', 0.5);

        % Histogram for Class 3
        histogram(class3Data(:, i), 'BinWidth', 0.1, 'DisplayName', classNames{3}, 'FaceAlpha', 0.5);


        
        % Add titles and legends
        title(['Feature ', num2str(i)]);
        legend show;
        
        hold off;
    end
end
%}

function plotClassFeatureHistograms(dataMatrix)
    % This function plots histograms for each feature, grouped by class,
    % ensuring they are fully opaque and not hidden behind each other.
    
    % Extract the number of samples per class and number of features
    N = size(dataMatrix, 1) / 3;
    numFeatures = size(dataMatrix, 2);
    
    % Define class data
    class1Data = dataMatrix(1:N, :);
    class2Data = dataMatrix(N+1:2*N, :);
    class3Data = dataMatrix(2*N+1:end, :);
    
    % Create a figure with subplots for each feature
    figure;
    for i = 1:numFeatures
        subplot(numFeatures, 1, i);
        hold on;
        
        % Set common bin edges for alignment
        minEdge = min(dataMatrix(:, i));
        maxEdge = max(dataMatrix(:, i));
        binEdges = linspace(minEdge, maxEdge, 15); % Adjust the number of bins as needed

        % Histogram for Class 1
        histogram(class1Data(:, i), 'BinEdges', binEdges, 'DisplayName', 'Class 1', 'FaceColor', 'r', 'FaceAlpha', 1, 'EdgeColor', 'k');

        % Histogram for Class 2
        histogram(class2Data(:, i), 'BinEdges', binEdges, 'DisplayName', 'Class 2', 'FaceColor', 'g', 'FaceAlpha', 1, 'EdgeColor', 'k');

        % Histogram for Class 3
        histogram(class3Data(:, i), 'BinEdges', binEdges, 'DisplayName', 'Class 3', 'FaceColor', 'b', 'FaceAlpha', 1, 'EdgeColor', 'k');

        % Add titles and legends
        title(['Feature ', num2str(i)]);
        legend show;
        
        hold off;
    end
end

