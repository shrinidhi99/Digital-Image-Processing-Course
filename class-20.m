k = double(k);
k1 = k + 25 * randn(size(k));
imtool(k1, [])
k1

imtool(k, [])
J = reshape(kmeans(k(:), 2), size(k1));
imtool(J, [])


function N = I2B(I)
    t = graythresh(I);
    N = im2bw(I, t);
end