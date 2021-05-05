% frequency
% amplitude
% phase

k = imread('cameraman.tif');
imtool(k, []);
f = fft2(k);
imtool(abs(f), []);
imtool(log10(abs(f), []));
imtool(log10(abs(fftshift(f)), []));