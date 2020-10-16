k = imread('cameraman.tif');
msk = ones(5, 5)*.1/25;
k2 = conv2(k, msk, 'same');
imtool(k2, []);
imtool(k, []);

kf = fft2(k);
mskf = fft2(msk, 256, 256);
kf1 = fftshift(kf);
kmskf = fftshift(mskf);

imtool(log(abs(kf1)), []);
imtool(log(abs(kmskf)), []);

m = kf1.*kmskf;
imtool(log(abs(m)), []);
m1 = ifft2(ifftshift(m));
imtool(m1, []);

mk = zeros(256, 256);
mk(128-10:128+10, 128-10:128+10) = 1;
imtool(mk, []);
imtool(log(abs(kf1)), []);
r = kf1.*mk;
imtool(log(abs(r)), []);
r1 = ifft2(ifftshift(r));
imtool(r1, []);

imtool(mk, []);
mk1 = 1 - mk;
imtool(mk1, []);
r1 = kf1.*mk1;
imtool(log(abs(r1)), []);
r2 = ifft2(ifftshift(r1));
imtool(r2, []);

mk(128-30:128+30, 128-30:128+30) = 1;
imtool(mk, []);
mk1 = 1 - mk;
r1 = kf1.*mk1;
imtool(log(abs(r1)), []);
r2 = ifft2(ifftshift(r1));
imtool(r2, []);