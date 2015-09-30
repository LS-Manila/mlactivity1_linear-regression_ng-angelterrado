x = load('ex2x.dat');
y = load('ex2y.dat');
plot(x,y,'o');
xlabel('Age(years)');
ylabel('Height(meters)');
m = length(y)
x = [ones(m,1),x];
ALPHA = 0.07;
theta = [0;0];
theta = theta - (ALPHA * (1/m) * x' * (x*theta-y))
MAX_ITERATION = 1500; 
for i = 1:MAX_ITERATION
theta = theta - (ALPHA * (1/m) * x' * (x * theta - y))
end
plot(x(:,2),y,'o');
xlabel('Age(years)');
ylabel('Height(meters)');
hold on;
plot(x(:,2),x*theta,'-');
legend('training data','linear regression');
J_vals = zeros(100,100);
theta0_vals = linspace(-3,3,100);
theta1_vals = linspace(-1,1,100);
for i = 1:length(theta0_vals)
for j = 1:length(theta1_vals)
t = [theta0_vals(i),theta1_vals(j)];
J_vals(i,j) = (1/(2*m))*sum((x * t' - y).^2);
end
end
J_vals = J_vals';
surf(theta0_vals,tehta1_vals,J_vals);
xlabel('\theta_0');
ylabel('\theta_1');

