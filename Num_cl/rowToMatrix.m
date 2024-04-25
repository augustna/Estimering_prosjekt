function matrix = rowToMatrix(row)
    n_pixels = size(row,2);
    sqrt_n_pixels = int32(sqrt(n_pixels));
    matrix = zeros(sqrt_n_pixels, sqrt_n_pixels);
    
    for k = 1:n_pixels
        matrix(idivide(k - 1, sqrt_n_pixels) + 1, mod(k - 1, sqrt_n_pixels) + 1) = row(k);            
    end
end