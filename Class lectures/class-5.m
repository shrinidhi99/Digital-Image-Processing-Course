/*
    * an image of degraded text document is required to perform this experiment
*/
k = imread('degradedtext.jpg');
imtool(k);
min_val = min(k(:))
max_val = max(k(:))

t = 125;
b = k;
b(b <= t) = 0;
b(b ~= 0) = 1;

imtool(b, [])