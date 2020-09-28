function [h c g1] = histeq1(g)

g = double(g);
[m n] = size(g);
h = zeros(1, 256);
g1 = zeros(m, n);

for i = 1 : m
    for j = 1 : n
        x = g(i, j);
        if(x ~= 0)
            h(x) = h(x) + 1;
        end
    end
end

h = h./sum(h(:));
for i = 1 : 256
    c(i) = sum(h(1 : i));
end

for i = 1 : m
    for j = 1 : n
        x = g(i, j);
        if(x ~= 0)
            g1(i, j) = c(x) * 255;
        end
    end
end
end