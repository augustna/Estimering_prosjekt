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

%Merge


% Target vectors
t_k_1 = [1 0 0]';
t_k_2 = [0 1 0]';
t_k_3 = [0 0 1]';

t_k = [1 0 0;
       0 1 0;
       0 0 1];
     

N = 30; %Training 30 samples
C = 3; %number of classes
alpha = 0.1;

%Init
grad_W_MSE = zeros(3,5);
W = zeros(3,5);
m = 1; %Iterations
vecof1 = [1;1;1];
while m < 100
   
    %Train 
    for k = 1:N

        x_k = [x1Train(k,:)' x2Train(k,:)' x3Train(k,:)'];
        z_k = W * x_k;
        %Sigmoid
        g_k = 1./(1+exp(-z_k));
        %Gradients
        grad_gk_MSE = g_k-t_k;
        grad_zk_g = g_k.*(1-g_k);
        grad_W_zk = x_k';
        %MSE
        grad_W_MSE = grad_gk_MSE*grad_zk_g*grad_W_zk;
    end

    W = W -alpha*grad_W_MSE;

    m = m +1;
end


