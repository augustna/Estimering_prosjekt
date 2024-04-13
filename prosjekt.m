x1all = load('class_1','-ascii');
x2all = load('class_2','-ascii');
x3all = load('class_3','-ascii');
xAllTable = readtable('iris.data', 'FileType', 'text', 'Format', '%f%f%f%f%C', 'ReadVariableNames', false);


disp(T);

% Target vectors
t1 = [1 0 0]';
t2 = [0 1 0]';
t3 = [0 0 1]';

%{
%MSE
MSE = 0.5 * 

alpha = 0.1;

%m = ? Tror man kan velge m fritt. Iterations
m = 150;

%W0 = ?
W0 = [];
%}
% Definere sigmoid funksjon
m = 5;
for k = 1:m
    
end