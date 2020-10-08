/* 
    * Experiment 1
    * Enter the file having number plate of car
    * sir has written a program which demonstrates connected component concept
    * program is not shown
*/

k = imread('number-plate.jpg');
imtool(k, []);

/*
    * Experiment 2
    * Intensity domain
    * Frequency domain
*/

k = imread('cameraman.tif');
imtool(k, []);
k(100, 100);

f = fftshift(fft2(k));
imtool(log10(real(f)), []);
imtool(k, []);