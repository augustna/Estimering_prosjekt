x1all = load('class_1','-ascii');
x2all = load('class_2','-ascii');
x3all = load('class_3','-ascii');
xAllTable = readtable('iris.data', 'FileType', 'text', 'Format', '%f%f%f%f%C', 'ReadVariableNames', false);



% Target vectors
t_k = [1 0 0; 
        0 1 0; 
        0 0 1];

N = 30; %Training 30 samples
C = 3; %number of classes
alpha = 0.1;

%Init
grad_W_MSE = 0;
W = 0;
z_k = W*x_k;

%Sigmoid
g_k = 1/(1+exp(-z_k));

%Gradients
grad_gk_MSE = g_k-t_k;
grad_zk_g = g_k * (1-g_k);
grad_W_zk = x_k';


m = 1;
while m < 100
    

    for k = 1:N
        grad_W_MSE = grad_gk_MSE*grad_zk_g*grad_W_zk;
    end
    grad_gk_MSE = g_k-t_k;
    grad_zk_g = gk * (1-g_k);
    grad_W_zk = x_k';
    W = W -alpha*grad_W_MSE;

    m = m +1;
end


