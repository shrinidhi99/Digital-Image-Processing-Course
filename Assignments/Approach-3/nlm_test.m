k = imread('brain.jpg');
k = double(k);

% Denoising parameters
t = 5;
f = 2;
h1 = 1;
h2 = 10;
selfsim = 0;

k1 = k + 5 * randn(size(k));
k2 = k + 10 * randn(size(k));
k3 = k + 15 * randn(size(k));
k4 = k + 20 * randn(size(k));
k5 = k + 25 * randn(size(k));

imtool(k1, []);
denoised_1 = simple_nlm(k1,t,f,h1,h2,selfsim);
imtool(denoised_1, []);
d1 = (k - denoised_1).^2;
mse1 = mean(d1(:));
rms1 = sqrt(mse1);
psnr1 = 20 * log10(255/rms1);

imtool(k2, []);
denoised_2 = simple_nlm(k2,t,f,h1,h2,selfsim);
imtool(denoised_2, []);
d2 = (k - denoised_2).^2;
mse2 = mean(d2(:));
rms2 = sqrt(mse2);
psnr2 = 20 * log10(255/rms2);

imtool(k3, []);
denoised_3 = simple_nlm(k3,t,f,h1,h2,selfsim);
imtool(denoised_3, []);
d3 = (k - denoised_3).^2;
mse3 = mean(d3(:));
rms3 = sqrt(mse3);
psnr3 = 20 * log10(255/rms3);

imtool(k4, []);
denoised_4 = simple_nlm(k4,t,f,h1,h2,selfsim);
imtool(denoised_4, []);
d4 = (k - denoised_4).^2;
mse4 = mean(d4(:));
rms4 = sqrt(mse4);
psnr4 = 20 * log10(255/rms4);

imtool(k5, []);
denoised_5 = simple_nlm(k5,t,f,h1,h2,selfsim);
imtool(denoised_5, []);
d5 = (k - denoised_5).^2;
mse5 = mean(d5(:));
rms5 = sqrt(mse5);
psnr5 = 20 * log10(255/rms5);
