clc;
clear;
close all;

% Load the .mat file containing xyzPoints
mat_file = '34.mat';  % Change to your actual .mat file
oo = load(mat_file);
xyzPoints = oo.xyzPoints;

% Reshape xyzPoints if it's a 3D matrix
[numRows, numCols, numDims] = size(xyzPoints);
if numDims == 3
    apoints = reshape(xyzPoints, numRows * numCols, 3);
else
    error('Unexpected size of xyzPoints.');
end

% Convert to double precision
apoints = double(apoints);

% Downsample points to 10% to speed up processing
numPointsToSelect = round(size(apoints, 1) * 0.1);
randomIndices = randperm(size(apoints, 1), numPointsToSelect);
apoints = apoints(randomIndices, :);

% Create a pointCloud object
ptCloud = pointCloud(apoints);

% Fit a plane using RANSAC
maxDistance = 3.5;  % Increased distance threshold for inliers (try 0.1)
[planeModel, inlierIndices, outlierIndices] = pcfitplane(ptCloud, maxDistance);

% Extract the normal vector from the fitted plane
normalVector = planeModel.Normal; 

% Display number of inliers and outliers for debugging
disp(['Number of Inliers: ', num2str(numel(inlierIndices))]);
disp(['Number of Outliers: ', num2str(numel(outlierIndices))]);

% Project points onto the normal
distances = abs((apoints - mean(apoints, 1)) * normalVector');

% Normalize distances for color mapping
distances = (distances - min(distances)) / (max(distances) - min(distances));

% Colorize the inliers (green) and outliers (yellow)
colors = zeros(size(apoints, 1), 3); 
colors(inlierIndices, :) = repmat([0, 1, 0], numel(inlierIndices), 1); % Green for inliers
colors(outlierIndices, :) = repmat([1, 1, 0], numel(outlierIndices), 1); % Yellow for outliers

% Show the colored point cloud
ptCloud = pointCloud(apoints, 'Color', colors);
pcshow(ptCloud);
view(2);

% Save the colored point cloud to an .obj file
outputFile = '01_eigen_colormap.obj';
fileID = fopen(outputFile, 'w');
for i = 1:size(apoints, 1)
    fprintf(fileID, "v %f %f %f %f %f %f\n", apoints(i, 1), apoints(i, 2), apoints(i, 3), colors(i, 1), colors(i, 2), colors(i, 3));
end
fclose(fileID);
disp('Saved point cloud to 01_eigen_colormap.obj');