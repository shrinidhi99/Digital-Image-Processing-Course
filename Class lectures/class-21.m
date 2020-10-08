/*
    * Mathematical morphology
    * Dilation
    * Erosion
    * Input image is a binarized circle
    * Structuring element, SE can be of any shape
*/

/*
    * Dilation
*/
k = imread('circle.gif');
imtool(k, []);
SE = strel('disk', 5, 0);
D = imdilate(k, SE);
imtool(k, []);
imtool(D, []);
imtool((D - k), []);

/*
    * Erosion
*/

k = imread('circle.gif');
imtool(k, []);
SE = strel('square', 5);
E = imerode(k, SE);
imtool(k, []);
imtool(E, []);

/*
    * Problem: How many circles are there in this image?
    * Use erosion followed by connected components
*/

k = imread('stones.jpg');
k = rgb2gray(k);
k = I2B(k);
SE = strel('square', 7);
E = imerode(k, SE);
imtool(E, []);
[L, n] = bwlabel(E, 8);
imtool(L, []);