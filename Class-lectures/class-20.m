/*
    * k: image
*/
k = imread('cameraman.tif');
k = double(k);
k1 = k + 25 * randn(size(k));
imtool(k1, []);
k1 = k + 4 * randn(size(k));
imtool(k1, []);
bimage = ithreshold(k1);

imtool(k, []);
J = reshape(kmeans(k(:), 2), size(k1));
imtool(J, []);
k1 = k + 20 * randn(size(k));
imtool(k1, []);

/*
    * Image to binary function
    * t: threshold of the grayscale image
    * N: Binary image
*/

function N = I2B(I)
    t = graythresh(I);
    N = im2bw(I, t);
end