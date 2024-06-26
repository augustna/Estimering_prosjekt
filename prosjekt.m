x1all = load('class_1','-ascii');
x2all = load('class_2','-ascii');
x3all = load('class_3','-ascii');
xAllTable = readtable('iris.data', 'FileType', 'text', 'Format', '%f%f%f%f%C', 'ReadVariableNames', false);

%Construct training set

%Add bias
x1all(:,5) = 1;
x2all(:,5) = 1;
x3all(:,5) = 1;

%Extract first 30 rows for training
x1Train = x1all(1:30, :);
x2Train = x2all(1:30, :);
x3Train = x3all(1:30, :);

%Extract last 20 rows for testing
x1Test = x1all(31:50, :);
x2Test = x2all(31:50, :);
x3Test = x3all(31:50, :);

% Target vectors
t_k_1 = [1 0 0]';
t_k_2 = [0 1 0]';
t_k_3 = [0 0 1]';

t_k = [1 0 0;
       0 1 0;
       0 0 1];
     
N = 30; %Training 30 samples
C = 3; %number of classes
alpha = 0.001;

%Init
grad_W_MSE = ones(3,5);
W = zeros(3,5);
m = 1; %Iterations
vecof1 = [1;1;1];

tol = ones(3, 5) * 0.1;
iterations = 0;

test_answers = zeros(20, 3);
while abs(grad_W_MSE) >= tol
   
    %Train 
    for k = 1:N
        x_k = [x1Train(k,:)' x2Train(k,:)' x3Train(k,:)'];
        z_k = W * x_k;
        W
        x_k
        z_k
        %Sigmoid
        g_k = 1./(1+exp(-z_k));
        %Gradients
        grad_gk_MSE = g_k-t_k;
        grad_zk_g = g_k.*(1-g_k);
        grad_W_zk = x_k';
        %MSE
        grad_W_MSE = grad_W_MSE + grad_gk_MSE*grad_zk_g*grad_W_zk;
    end

    W = W -alpha*grad_W_MSE;

    iterations = iterations + 1;
end

disp(iterations);
g = zeros(60, 3);
% Test
for k = 1:20
    x_k = [x1Test(k,:)' x2Test(k,:)' x3Test(k,:)'];
    z_k = W * x_k;
    %Sigmoid
    g_k = 1./(1+exp(-z_k));
    
    [~, test_result1] = max(g_k(:, 1));
    [~, test_result2] = max(g_k(:, 2));
    [~, test_result3] = max(g_k(:, 3));
    
    test_answers(k, 1) = test_result1;
    test_answers(k, 2) = test_result1;
    test_answers(k, 3) = test_result1;
end


