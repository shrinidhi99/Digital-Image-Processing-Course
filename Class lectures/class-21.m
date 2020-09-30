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
k = imread('circle.jpg');
imtool(k, []);
SE = strel('disk', 5, 0);
D = imdilate(k, SE);
imtool(k, []);
imtool(D, []);
imtool((D - k), []);

/*
    * Erosion
*/

k = imread('circle.jpg');
imtool(k, []);
SE = strel('square', 5);
E = imerode(k, SE);
imtool(k, []);
imtool(E, []);

/*
    * Problem: How many circles are there in this image?
    * Use erosion followed by connected components
*/

k = imread('count-circle.jpg');
SE = strel('square', 7);
E = imerode(E, SE);
imtool(E, []);
[L, n] = bwlabel(E, 8);
imtool(L, []);
n // number of connected components