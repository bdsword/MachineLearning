function u = matrixAverageIntensity(m)
    rowNum = size(m, 1);
    u = sum(m) / rowNum;
end
