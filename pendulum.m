clear all; clc;

figure;
[xx, yy] = meshgrid((-.5:0.05:4.5)*pi, -3:0.05:3);
E = .5*yy.^2 - cos(xx);
contour(xx, yy, E)
axis equal
axis([0, 4*pi, -3, 3])
set(gca, 'XTick', (0:4)*pi)
set(gca, 'XTickLabel', {'0', 'pi', '2pi', '3pi', '4pi'})
hold on;
% hold off;
% 
% 
% figure;
colors = 'rgbyc';
rhs = @(t, x) [x(2); -0.1*x(2) - sin(x(1))];
options= odeset('RelTol', 1e-7);
for y0 = 0:15
    [t, x] = ode45(rhs, [0, 25], [0; 0.2*y0], options);
    plot(x(:,1), x(:, 2), colors(mod(y0,5)+1))
    hold on
end
plot([0,0],[-3,3],'k:',[4*pi,4*pi],[-3,3],'k:')
axis equal
axis([-pi/2, 4.5*pi, -3, 3])
xlabel 'x'
ylabel 'y'
set(gca, 'XTick', (0:4)*pi)
set(gca, 'XTickLabel', {'0', 'pi', '2pi', '3pi', '4pi'})
hold off;


figure, hold on
for y0 = 0:0.2:3
    [t, x] = ode45(rhs, [0, 25], [0; y0], options);
    subplot(2, 1, 1), hold on
    plot(t, x(:,1))
    subplot(2, 1, 2), hold on
    plot(t, x(:, 2))
    hold on
end
subplot(2, 1, 1)
xlabel t
ylabel 'x = angle'
set(gca, 'YTick', (0:4)*pi)
set(gca, 'YTickLabel', {'0', 'pi', '2pi', '3pi', '4pi'})
subplot(2, 1, 2)
xlabel t
ylabel 'y = angular velocity'
