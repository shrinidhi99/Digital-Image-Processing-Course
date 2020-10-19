function H = butterworth(M, N, D0)
    u = 0 : (M-1);
    v = 0 : (N-1);
    n = 2;
    idx = find(u > M/2);
    u(idx) = u(idx) - M;
    idy = find(v > N/2);
    v(idy) = v(idy) - N;
    [V, U] = meshgrid(v, u);
    D = sqrt(U.^2 + V.^2);
    H = 1./(1 + (D./D0).^(2*n));
    H = fftshift(H);
end