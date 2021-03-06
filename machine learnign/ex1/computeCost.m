function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

z = X*theta; % gives m by 1 vector of hypotheses for each training example
h = sigmoid(z); % m by 1
J = (1./size(X,1)).*(-y'.*log(h)-(1-y)'.*log(1-h));


% =========================================================================

end
