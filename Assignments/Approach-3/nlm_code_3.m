k = imread('brain.jpg');
k = double(k);

% Denoising parameters
t = 5;
f = 2;
h1 = 1;
h2 = 10;
selfsim = 0;

k1 = k + 5 * randn(size(k));
k2 = k + 10 * randn(size(k));
k3 = k + 15 * randn(size(k));
k4 = k + 20 * randn(size(k));
k5 = k + 25 * randn(size(k));

imtool(k1, []);
tic;
denoised_1 = simple_nlm(k1,t,f,h1,h2,selfsim);
toc;
imtool(denoised_1, []);
d1 = (k - denoised_1).^2;
mse1 = mean(d1(:));
rms1 = sqrt(mse1);
psnr1 = 20 * log10(255/rms1);

imtool(k2, []);
tic;
denoised_2 = simple_nlm(k2,t,f,h1,h2,selfsim);
toc;
imtool(denoised_2, []);
d2 = (k - denoised_2).^2;
mse2 = mean(d2(:));
rms2 = sqrt(mse2);
psnr2 = 20 * log10(255/rms2);

imtool(k3, []);
tic;
denoised_3 = simple_nlm(k3,t,f,h1,h2,selfsim);
toc;
imtool(denoised_3, []);
d3 = (k - denoised_3).^2;
mse3 = mean(d3(:));
rms3 = sqrt(mse3);
psnr3 = 20 * log10(255/rms3);

imtool(k4, []);
tic;
denoised_4 = simple_nlm(k4,t,f,h1,h2,selfsim);
toc;
imtool(denoised_4, []);
d4 = (k - denoised_4).^2;
mse4 = mean(d4(:));
rms4 = sqrt(mse4);
psnr4 = 20 * log10(255/rms4);

imtool(k5, []);
tic;
denoised_5 = simple_nlm(k5,t,f,h1,h2,selfsim);
toc;
imtool(denoised_5, []);
d5 = (k - denoised_5).^2;
mse5 = mean(d5(:));
rms5 = sqrt(mse5);
psnr5 = 20 * log10(255/rms5);

function [output]=simple_nlm(input,t,f,h1,h2,selfsim)
 
    %
    %  input   : image to be filtered
    %  t       : radius of search window
    %  f       : radius of similarity window
    %  h1,h2   : w(i,j) = exp(-||GaussFilter(h1) .* (p(i) - p(j))||_2^2/h2^2)
    %  selfsim : w(i,i) = selfsim, for all i
    %
    %  Note:
    %    if selfsim = 0, then w(i,i) = max_{j neq i} w(i,j), for all i
    
    [m n]=size(input);
    pixels = input(:);

    s = m*n;

    psize = 2*f+1;
    nsize = 2*t+1;
    % Compute patches
    padInput = padarray(input,[f f],'symmetric'); 
    filter = fspecial('gaussian',psize,h1);
    patches = repmat(sqrt(filter(:))',[s 1]) .* im2col(padInput, [psize psize], 'sliding')';

    % Compute list of edges (pixel pairs within the same search window)
    indexes = reshape(1:s, m, n);
    padIndexes = padarray(indexes, [t t]);
    neighbors = im2col(padIndexes, [nsize, nsize], 'sliding');
    TT = repmat(1:s, [nsize^2 1]);
    edges = [TT(:) neighbors(:)];
    RR = find(TT(:) >= neighbors(:));
    edges(RR, :) = [];

    % Compute weight matrix (using weighted Euclidean distance)
    diff = patches(edges(:,1), :) - patches(edges(:,2), :);
    V = exp(-sum(diff.*diff,2)/h2^2); 
    W = sparse(edges(:,1), edges(:,2), V, s, s);

    % Make matrix symmetric and set diagonal elements
    if selfsim > 0
    W = W + W' + selfsim*speye(s);
    else
    maxv = max(W,[],2);
    W = W + W' + spdiags(maxv, 0, s, s);
    end     

    % Normalize weights
    W = spdiags(1./sum(W,2), 0, s, s)*W;

    % Compute denoised image
    output = W*pixels;
    output = reshape(output, m , n);
end