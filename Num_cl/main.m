%vector with C rows. One for each class. Number at row is the mean value of
%the class
C = 9;
trainv_row_mean = zeros(size(trainv, 1), 1);
class_mean = zeros(9, 1);


trainv_weighted_pos_mean = mean(trainv, 2);

%{
for k = 1:num_train
    trainv_row_mean(k) = sum(trainv, 2);
end
%}