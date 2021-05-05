function N = I2B(I)
    t = graythresh(I);
    N = im2bw(I, t);
end