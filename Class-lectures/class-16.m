k = imread('cameraman.tif');
k = double(k);
[gx gy] = gradient(k);
imtool(k, []);
imtool(gx, []);
imtool(gy, []);
M = sqrt(gx.^2 + gy.^2);
imtool(M, []);

h1 = [-1 0 1; -2 0 2; -1 0 1];
Gx = conv2(k, h1, 'same');
Gy = conv2(k, h1', 'same');
h1' // transpose of h1
imtool(Gx, []);
imtool(Gy, []);
M = sqrt(Gx.^2 + Gy.^2);
imtool(M, []);
