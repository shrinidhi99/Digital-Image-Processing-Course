k = imread('cameraman.tif');
k = double(k);
imtool(k, []);

k1 = k + 20 * randn(size(k));
k2 = k + 20 * randn(size(k));
k3 = k + 20 * randn(size(k));
k4 = k + 20 * randn(size(k));

k5 = (k1 + k2 + k3 + k4)./4;
imtool(k5, []);

d = (k - k1).^2;
mse = mean(d(:));
psnr = 20 * log10(255/sqrt(mse));

d1 = (k - k5).^2;
mse1 = mean(d1(:));
psnr1 = 20 * log10(255/sqrt(mse1));

lf = colfilt(k1, [7 7], 'sliding', @mean);
imtool(lf, []);
d2 = (k - lf).^2;
mse2 = mean(d2(:));
psnr2 = 20 * log10(255/sqrt(mse2));

h = fspecial('gaussian', 5, 1);
gf = conv2(k1, h, 'same');
imtool(gf, []);
d3 = (k - gf).^2;
mse3 = mean(d3(:));
psnr3 = 20 * log10(255/sqrt(mse3));

