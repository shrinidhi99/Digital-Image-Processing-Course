k = imread('brain.jpg');

k = double(k);
k1 = k + 5 * randn(size(k));
k2 = k + 10 * randn(size(k));
k3 = k + 15 * randn(size(k));
k4 = k + 20 * randn(size(k));
k5 = k + 25 * randn(size(k));

tic;
y1 = NLM(k, k1);
toc;
d1 = (uint8(k) - y1).^2;
mse1 = mean(d1(:));
rms1 = sqrt(mse1);
psnr1 = 20 * log10(255/rms1);

tic;
y2 = NLM(k, k2);
toc;
d2 = (uint8(k) - y2).^2;
mse2 = mean(d2(:));
rms2 = sqrt(mse2);
psnr2 = 20 * log10(255/rms2);

tic;
y3 = NLM(k, k3);
toc;
d3 = (uint8(k) - y3).^2;
mse3 = mean(d3(:));
rms3 = sqrt(mse3);
psnr3 = 20 * log10(255/rms3);

tic;
y4 = NLM(k, k4);
toc;
d4 = (uint8(k) - y4).^2;
mse4 = mean(d4(:));
rms4 = sqrt(mse4);
psnr4 = 20 * log10(255/rms4);

tic;
y5 = NLM(k, k5);
toc;
d5 = (uint8(k) - y5).^2;
mse5 = mean(d5(:));
rms5 = sqrt(mse5);
psnr5 = 20 * log10(255/rms5);

function cleared = NLM(I, k1)

    [m, n] = size(I);

    f = 2;
    t = 5;

    su = 1;
    sm = 0;
    ks = 2 * f + 1;

    ker = zeros(ks, ks);

    for x = 1:ks
        for y = 1:ks
            ab = x - f - 1;
            cd = y - f - 1;
            ker(x, y) = 100 * exp(((ab * ab) + (cd * cd))/(-2 * (su * su)));
            sm = sm + ker(x, y);
        end
    end

    kernel = ker ./ f;
    kernel = kernel / sm;

    noisy = k1;

    cleared = zeros(m, n);

    h = 10;

    noisy2 = padarray(noisy, [f, f], 'symmetric');

    for i = 1:m
        for j = 1:n
            im = i + f;
            jn = j + f;
            W1 = noisy2(im - f : im + f, jn - f : jn + f);
            rmin = max(im - t, f + 1);
            rmax = min(im + t, m + f);
            smin = max(jn - t, f + 1);
            smax = min(jn + t, n + f);
            
            NL = 0;
            Z = 0;
            
            for r = rmin : rmax
                for s = smin : smax
                    W2 = noisy2(r - f : r + f, s - f : s + f);
                    d2 = sum(sum(kernel.*(W1 - W2).*(W1 - W2)));
                    sij = exp(-d2/(h * h));
                    Z = Z + sij;
                    NL = NL + (sij * noisy2(r, s));
                end
            end
            cleared(i, j) = NL/Z;
        end
    end

    cleared = uint8(cleared);

    imtool(k1, []);
    imtool(cleared, []);
end