/*
    * Consider an image of a scenary
*/
k = imread('scenary.jpg')
k1 = rgb2gray(k);
I = histeq(k1);
imtool(k1)
imtool(I)

J = adapthisteq(k1);
imtool(J)
imtool(k1)
B = nlfilter(k1, [150 150], @localhisteq);
imtool(B)
imtool(J)