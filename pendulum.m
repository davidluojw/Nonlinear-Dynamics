[xx, yy] = meshgrid((-.5:0.05:4.5)*pi, -3:0.05:3);
E = .5*yy.^2 - cos(xx);
contour(xx, yy, E)
axis equal
axis([0, 4*pi, -3, 3])
set(gca, 'XTick', (0:4)*pi)
set(gca, 'XTickLabel', {'0', 'pi', '2pi', '3pi', '4pi'})
