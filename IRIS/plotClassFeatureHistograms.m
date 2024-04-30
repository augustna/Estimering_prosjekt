function plotClassFeatureHistograms(dataMatrix)
    N = size(dataMatrix, 1) / 3;
    numFeatures = size(dataMatrix, 2);
    
    class1Data = dataMatrix(1:N, :);
    class2Data = dataMatrix(N+1:2*N, :);
    class3Data = dataMatrix(2*N+1:end, :);
    
    figure;
    for i = 1:numFeatures
        subplot(numFeatures, 1, i);
        hold on;
        
        minEdge = min(dataMatrix(:, i));
        maxEdge = max(dataMatrix(:, i));
        binEdges = linspace(minEdge, maxEdge, 15);

        histogram(class1Data(:, i), 'BinEdges', binEdges, 'DisplayName', 'Class 1', 'FaceColor', 'r', 'FaceAlpha', 1, 'EdgeColor', 'k');
        histogram(class2Data(:, i), 'BinEdges', binEdges, 'DisplayName', 'Class 2', 'FaceColor', 'g', 'FaceAlpha', 1, 'EdgeColor', 'k');
        histogram(class3Data(:, i), 'BinEdges', binEdges, 'DisplayName', 'Class 3', 'FaceColor', 'b', 'FaceAlpha', 1, 'EdgeColor', 'k');

        title(['Feature ', num2str(i)]);
        legend show;
        
        hold off;
    end
end

