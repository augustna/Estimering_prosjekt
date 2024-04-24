x1all = load('./class_1','-ascii');
x2all = load('./class_2','-ascii');
x3all = load('./class_3','-ascii');
xAllTable = readtable('iris.data', 'FileType', 'text', 'Format', '%f%f%f%f%C', 'ReadVariableNames', false);


xAll = [x1all; x2all; x3all];

plotClassFeatureHistograms(xAll);

