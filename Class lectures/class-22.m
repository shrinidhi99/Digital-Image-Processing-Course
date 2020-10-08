% morphology
% images.jpg has a collection of round stones
k = imread('stones.jpg');
k = rgb2gray(k);
imtool(k, []);
% convert image to binary
N = I2B(k);
imtool(N, []);
SE = strel('disk', 3, 0);
E = imerode(N, SE);
imtool(E, []);
SE = strel('disk', 1, 0);
E = imerode(E, SE);
[L, n] = bwlabel(E, 8);
% be careful while you are selecting the structuring element
% a ball with 3 holes
k = imread('cir-with-3-holes.jpeg');
imtool(k, []);
SE = strel('disk', 9, 0);
D = imdilate(k, SE);
imtool(D, []);
SE = strel('disk', 11, 0);
D = imdilate(k, SE);
imtool(D, []);
imtool(D - k, []);
E = imerode(D, SE);
imtool(E, []);
imtool(E - k, []);
clear all;
% dilation followed by erosion -> imclose
% erosion followed by dilation -> imopen
% combination of dilation and erosion
C = imclose(k, SE);
imtool(C, []);
imtool(C - k, []);
clear all;
% MRI of head
k = imread('brain-mri.jpeg');
imtool(k, []);
I1 = k(:, :, 1);
I = im2bw(I1, graythresh(I1));
imtool(I, []);

st = strel('disk', 3);
Ic = imopen(I, st);
imtool(Ic, []);
b = bwlabel(Ic, 8);
[L, n] = bwlabel(Ic, 8);
b(b ~= 7) = 0;
imtool(b, []);
b(b ~= 0) = 1;
imtool(b, []);
st = strel('square', 7);
b1 = imclose(b, st);
imtool(b1, []);
Ir = double(I1).*b1;
imtool(Ir, []);