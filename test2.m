mat_file = '18.mat';  % 
oo = load(mat_file);
xyzPoints = oo.xyzPoints;
[numRows, numCols, numDims] = size(xyzPoints);
if numDims == 3
    apoints = reshape(xyzPoints, numRows * numCols, 3); 
    %make it 2d, each row is x,y,z
else
    error('Unexpected size of xyzPoints.');
end
% Convert to double precision
apoints = double(apoints);
ptCloud = pointCloud(apoints);
pcshow(ptCloud);