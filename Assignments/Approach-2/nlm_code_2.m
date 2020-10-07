% function: img_f = nlm(img_n, halfPatchSize, windowHalfSearchSize, N_n, sigma, h)
% input:    img_n, double image (grayscale) corrupted by Gaussian noise with std sigma;
%           halfPatchSize, half size of the patch used by NLM;
%           windowHalfSearchSize, half size of the windows used to search for neighbors;
%           N_n, number of neighbors used by NLM;
%           sigma, std of the noise;
%           h, filtering parameter for NLM;
% output:   img_f, filtered image.

% parameters
halfPatchSize = 3;          % half size of the patch
windowHalfSearchSize = 6;   % half size for searching the neighbors
N_n = 16;                   % number of neighbors

% create an image to denoise
img = imread('brain.jpg');
img = double(img);

% standard deviation = 5
sigma = 5;                % noise std
h = 0.3 * sigma^2;          % nlm filtering parameter

img_n_1 = img + randn(size(img)) * sigma;
tic;
denoised_1 = nlm(img_n_1, halfPatchSize, windowHalfSearchSize, N_n, sigma, h);
toc;

% errors
mse_n_1 = mean((img(:)-img_n_1(:)).^2);
mse_nn_1 = mean((img(:)-denoised_1(:)).^2);
rms1 = sqrt(mse_nn_1);
psnr1 = 20 * log10(255/rms1);

imtool(img_n_1, []);
imtool(denoised_1, []);

% standard deviation = 10
sigma = 10;                % noise std
h = 0.3 * sigma^2;          % nlm filtering parameter
img_n_2 = img + randn(size(img)) * sigma;
tic;
denoised_2 = nlm(img_n_2, halfPatchSize, windowHalfSearchSize, N_n, sigma, h);
toc;

% errors
mse_n_2 = mean((img(:)-img_n_2(:)).^2);
mse_nn_2 = mean((img(:)-denoised_2(:)).^2);
rms2 = sqrt(mse_nn_2);
psnr2 = 20 * log10(255/rms2);

imtool(img_n_2, []);
imtool(denoised_2, []);

% standard deviation = 15
sigma = 15;                % noise std
h = 0.3 * sigma^2;          % nlm filtering parameter

img_n_3 = img + randn(size(img)) * sigma;
tic;
denoised_3 = nlm(img_n_3, halfPatchSize, windowHalfSearchSize, N_n, sigma, h);
toc;

% errors
mse_n_3 = mean((img(:)-img_n_3(:)).^2);
mse_nn_3 = mean((img(:)-denoised_3(:)).^2);
rms3 = sqrt(mse_nn_3);
psnr3 = 20 * log10(255/rms3);

imtool(img_n_3, []);
imtool(denoised_3, []);

% standard deviation = 20
sigma = 20;                % noise std
h = 0.3 * sigma^2;          % nlm filtering parameter
img_n_4 = img + randn(size(img)) * sigma;
tic;
denoised_4 = nlm(img_n_4, halfPatchSize, windowHalfSearchSize, N_n, sigma, h);
toc;

% errors
mse_n_4 = mean((img(:)-img_n_4(:)).^2);
mse_nn_4 = mean((img(:)-denoised_4(:)).^2);
rms4 = sqrt(mse_nn_4);
psnr4 = 20 * log10(255/rms4);

imtool(img_n_4, []);
imtool(denoised_4, []);

% standard deviation = 25
sigma = 25;                % noise std
h = 0.3 * sigma^2;          % nlm filtering parameter
img_n_5 = img + randn(size(img)) * sigma;
tic;
denoised_5 = nlm(img_n_5, halfPatchSize, windowHalfSearchSize, N_n, sigma, h);
toc;

% errors
mse_n_5 = mean((img(:)-img_n_5(:)).^2);
mse_nn_5 = mean((img(:)-denoised_5(:)).^2);
rms5 = sqrt(mse_nn_5);
psnr5 = 20 * log10(255/rms5);

imtool(img_n_5, []);
imtool(denoised_5, []);


function img_f = nlm(img_n, halfPatchSize, windowHalfSearchSize, N_n, sigma, h)

    % init
    [ys, xs] = size(img_n);
    cs = 1;
    patchSize = 2 * halfPatchSize + 1;
    P = cs * patchSize^2;
    expected_squared_distance = 2 * sigma^2;

    % Init buffers
    neighbors_indexes = zeros(ys, xs, N_n);
    neighbors_d2 = ones(ys, xs, N_n) * inf;
    padded_img_n = padarray(img_n, [windowHalfSearchSize windowHalfSearchSize 0], 'symmetric');
    
    % For each shift
    index = 0;
    for dy = -windowHalfSearchSize:windowHalfSearchSize
        for dx = -windowHalfSearchSize:windowHalfSearchSize
            
            % shift index
            index = index + 1;
            
            % shifted image (with mirroring)
            shifted_img_n = padded_img_n((windowHalfSearchSize + 1 + dy):(windowHalfSearchSize + ys + dy), ...
                (windowHalfSearchSize + 1 + dx):(windowHalfSearchSize + xs + dx), ...
                :);
            
            % squared distance between the shifted and the reference image
            current_d2 = imfilter(sum((shifted_img_n - img_n).^2, 3), ones(patchSize)/P, 'symmetric');
            current_indexes = ones(ys, xs) * index;
            
            % update neighbors
            for n = 1 : N_n
                
                % is the current neighbor closer than the stored one?
                swap = abs(current_d2 - 0 * expected_squared_distance) < abs(neighbors_d2(:, :, n) - 0 * expected_squared_distance);
                
                % swap (indexes, distances)
                neighbors_indexes_n = neighbors_indexes(:, :, n);
                buffer_indexes_n = neighbors_indexes_n;
                neighbors_indexes_n(swap) = current_indexes(swap);
                current_indexes(swap) = buffer_indexes_n(swap);
                neighbors_indexes(:, :, n) = neighbors_indexes_n;
                
                neighbors_d2_n = neighbors_d2(:, :, n);
                buffer_d2_n = neighbors_d2_n;
                neighbors_d2_n(swap) = current_d2(swap);
                current_d2(swap) = buffer_d2_n(swap);
                neighbors_d2(:, :, n) = neighbors_d2_n;               
                
            end
        end
    end
    
    % init num / den
    num = zeros(ys, xs, cs);
    den = zeros(ys, xs, cs);
    
    % do another loop on the possible neighbors to filter
    index = 0;
    for dy = -windowHalfSearchSize:windowHalfSearchSize
        for dx = -windowHalfSearchSize:windowHalfSearchSize
            
            % shift index
            index = index + 1;
            
            % shifted image (with mirroring)
            shifted_img_n = padded_img_n((windowHalfSearchSize + 1 + dy):(windowHalfSearchSize + ys + dy), ...
                (windowHalfSearchSize + 1 + dx):(windowHalfSearchSize + xs + dx), ...
                :);
            
            % For every neighbors
            for n = 1 : N_n
            
                % weights
                buffer_weights = (neighbors_indexes(:, :, n) == index) .* exp(-(max(0, neighbors_d2(:, :, n) - 2 * sigma^2))/(h^2));
                weights = repmat(imfilter(buffer_weights, ones(patchSize), 'symmetric'), [1 1 cs]);
                num = num + weights .* shifted_img_n;
                den = den + weights;
                
            end
        end
    end

    % filtered image
    img_f = num./den;

end
