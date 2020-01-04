function [PC,V] = pca(data)

% data - MxN matrix of input data
[M,N] = size(data);

% subtract off the mean for each dimension
mn = mean(data,2);
data = data - repmat(mn,1,N);

% construct the matrix Y
Y = data' / sqrt(N-1);

% SVD does it all 
[u,S,PC] = svd(Y);

% calculate the variances
S = diag(S);
V = S .* S;

end
