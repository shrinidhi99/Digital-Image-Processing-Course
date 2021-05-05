% fourier transform
% detect shapes. Image must be in binarized form.
k = imread('circle.gif');
imtool(k, []);
% k1 = (1-k);
% imtool(k1, []);
[L, num] = bwlabel(k);
imtool(L, []);
s = regionprops(L, 'area', 'perimeter');

for i=1:num
    x(i) = s(i).Area;
    y(i) = s(i).Perimeter;
    form(i) = 4.*pi.*x(i)./(y(i).^2);
end
