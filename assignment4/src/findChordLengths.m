function chordLengths = findChordLengths(points)
    n = length(points);
    distances = sqrt(sum((points - circshift(points, 1)).^2, 2));
    chordLengths = cumsum(distances);
endfunction
