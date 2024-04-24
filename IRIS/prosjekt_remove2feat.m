%run('confusionMatrix.m');

x1all = load('./class_1','-ascii');
x2all = load('./class_2','-ascii');
x3all = load('./class_3','-ascii');
xAllTable = readtable('iris.data', 'FileType', 'text', 'Format', '%f%f%f%f%C', 'ReadVariableNames', false);

%Construct training set

%Add bias
x1all(:,5) = 1;
x2all(:,5) = 1;
x3all(:,5) = 1;

% 2b) Removing feature 2 and 3 XD
% Remove the second column and shift others to the left
for k = 1:2
    x1all(:, 2) = [];
    x2all(:, 2) = [];
    x3all(:, 2) = [];
end



%Extract first 30 rows for training

x1Train = x1all(1:30, :);
x2Train = x2all(1:30, :);
x3Train = x3all(1:30, :);
xTrain = [x1Train; x2Train; x3Train];


%Extract last 30 rows for training
%{
x1Train = x1all(21:50, :);
x2Train = x2all(21:50, :);
x3Train = x3all(21:50, :);
xTrain = [x1Train; x2Train; x3Train];
%}


%Extract last 20 rows for testing

x1Test = x1all(31:50, :);
x2Test = x2all(31:50, :);
x3Test = x3all(31:50, :);
xTest = [x1Test; x2Test; x3Test];


%Extract first 20 rows for testing
%{
x1Test = x1all(1:20, :);
x2Test = x2all(1:20, :);
x3Test = x3all(1:20, :);
xTest = [x1Test; x2Test; x3Test];
%}

% Target vectors
t_k_1 = [1 0 0]';
t_k_2 = [0 1 0]';
t_k_3 = [0 0 1]';

t_k = [1 0 0;
       0 1 0;
       0 0 1];
     
N_train = 90; %Training 90 samples

N_test = 60; %Testing 60 samples

C = 3; %number of classes
alpha = 0.01;

%Init
grad_W_MSE = ones(3,3);
W = zeros(3,3);
m = 1; %Iterations
vecof1 = [1;1;1];

tol = 0.01;
iterations = 0;

train_results = zeros(N_train, 1);
test_results = zeros(N_test, 1);

conf_mat = zeros(3,3);

while iterations <= 15000%norm(grad_W_MSE) >= tol
   
    %Train 
    for k = 1:N_train
        if k <= 30
            t_k = t_k_1;
        elseif k <= 60
            t_k = t_k_2;
        else
            t_k = t_k_3;
        end
        x_k = xTrain(k,:)';
        z_k = W * x_k;
        %Sigmoid
        g_k = 1./(1+exp(-z_k));
        
  
        
        %Gradients
        grad_gk_MSE = (g_k-t_k);
        grad_zk_g = g_k.*(1-g_k);
        grad_W_zk = x_k';
        %MSE
        grad_W_MSE = grad_W_MSE + (grad_gk_MSE.*grad_zk_g)*grad_W_zk;
    end
    
    
    
    

    W = W - alpha*grad_W_MSE;
    
    grad_W_MSE = 0;
    iterations = iterations + 1;
end


%confusion matrix for training
for k = 1:N_train
    x_k = xTrain(k,:)';
    z_k = W * x_k;
    %Sigmoid
    g_k = 1./(1+exp(-z_k));
    [~, train_result] = max(g_k);
    train_results(k) = train_result;
end


% Test
for k = 1:N_test
    x_k = xTest(k, :)';
    z_k = W * x_k;
    %Sigmoid
    g_k = 1./(1+exp(-z_k));
    [~, test_result] = max(g_k);
    
    test_results(k) = test_result;

end
%Confusion matrix
%True labels
truelabel_test = zeros(N_test,1);
truelabel_test(1:20) = 1;
truelabel_test(21:40) = 2;
truelabel_test(41:60) = 3;
conf_mat_test = confusionMatrix(test_results, truelabel_test);

truelabel_train = zeros(N_train,1);
truelabel_train(1:30) = 1;
truelabel_train(31:60) = 2;
truelabel_train(61:90) = 3;
conf_mat_train = confusionMatrix(train_results,truelabel_train);

err_train = calculateErrorRate(conf_mat_train);
err_test = calculateErrorRate(conf_mat_test);

