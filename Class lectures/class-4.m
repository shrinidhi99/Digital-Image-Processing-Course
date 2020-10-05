/* 
    * point operation
*/
k = imread('cameraman.tif');
imtool(k, [])
max_val = max(k(:))
k1 = max_val - k;
imtool(k1, [])

/*
    * Fourier transform
*/
f = fftshift(fft2(k));
imtool(abs(f), [])
imtool(k, [])
k2 = abs(f);
imtool(log(k2 + 1), [])

/*
    * binarize an image
*/
min_val = min(k(:))
max_val = max(k(:))

t = 150;

k1 = k;
k1(k1 <= t) = 0;
k1(k1 ~= 0) = 1;

imtool(k, []);
imtool(k1, []);