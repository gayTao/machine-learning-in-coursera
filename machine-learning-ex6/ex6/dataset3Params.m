function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 0.01;
sigma = 0.01;
theta = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
x1 = [1 2 1]; x2 = [0 4 -1];
m=size(theta,2);%theta������
mini=0;
% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
for i=1:m
    for j=1:m
        model= svmTrain(X, y, theta(i), @(x1, x2) gaussianKernel(x1, x2, theta(j)));
        predictions = svmPredict(model, Xval);
        if i==1&&j==1
            mini=mean(double(predictions ~= yval));
        end
        if mean(double(predictions ~= yval))<mini
            mini=mean(double(predictions ~= yval));
            C=theta(i);
            sigma=theta(j);
        end
    end
end


% =========================================================================

end
