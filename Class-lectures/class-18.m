k = imread('cameraman.tif');
k = double(k);
L = [1 1 1; 1 -8 1; 1 1 1];
k1 = conv2(k, L, 'same');
imtool(k1, []);
k2 = k - k1; // sharpened image
imtool(k2, [0 255]); 
m = ones(5, 5)./25;
s = conv2(k, m, 'same'); // blurred image
imtool(s, [0 255]);
imtool(k, [0 255]);

L1 = [-1 -1 -1; -1 9 -1; -1 -1 -1];
k3 = conv2(k, L1, 'same');
imtool(k3, [0 255]);

k = imread('degradedtext.jpg');
imtool(k, []);