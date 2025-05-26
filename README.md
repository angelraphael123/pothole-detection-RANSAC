
# Pothole Detection System Using Point Cloud Processing

This project implements a pothole detection system using **MATLAB** and **point cloud data**. The system processes 3D point cloud data to detect and highlight road potholes, leveraging the **RANSAC (Random Sample Consensus)** algorithm for plane fitting and anomaly detection.

---

## Features

- **3D Point Cloud Processing**:
  - Reads point cloud data from `.mat` files.
  - Detects road surfaces and potholes using RANSAC.
- **Visualization**:
  - Colorizes point cloud data for easy visualization:
    - Green: Road surface (inliers).
    - Yellow: Potholes (outliers).
- **Output**:
  - Saves the processed and colorized point cloud as an `.obj` file for external use.

---

## File Description

### MATLAB Script
- **`finalprog.m`**:
  - Reads 3D point cloud data from a `.mat` file.
  - Downsamples the data for efficient processing.
  - Fits a plane to the road surface using RANSAC.
  - Detects potholes as outliers from the fitted plane.
  - Colorizes the point cloud for visualization and saves it as an `.obj` file.

---

## Input and Output

### Input
- A `.mat` file containing `xyzPoints` (3D point cloud data). Ensure that:
  - The variable name in the `.mat` file matches `xyzPoints`.
  - The point cloud data is in a compatible format (e.g., [N x 3] matrix for X, Y, Z coordinates).

### Output
- A visualized and colorized point cloud displayed in MATLAB.
- An `.obj` file named `01_eigen_colormap.obj`, containing:
  - X, Y, Z coordinates.
  - RGB color values for visualization.

---

## System Requirements

- **MATLAB**: R2020a or later (with Point Cloud Toolbox installed).
- **Hardware**:
  - At least 8GB RAM.
  - Multi-core processor recommended for efficient processing.

---

## How to Run

1. **Prepare Input Data**:
   - Ensure your `.mat` file containing the point cloud data is in the same directory as the script.
   - Replace the `mat_file` variable in the script with the name of your `.mat` file.

2. **Run the Script**:
   - Open MATLAB and navigate to the folder containing `finalprog.m`.
   - Run the script:
     ```matlab
     finalprog
     ```

3. **View Results**:
   - The processed point cloud will be visualized in MATLAB.
   - The colored point cloud will be saved as `01_eigen_colormap.obj`.

---

## Example Usage

### Input
- Example `.mat` file: `34.mat`.

### Output
- Visualized point cloud with:
  - Green: Road surface.
  - Yellow: Potholes.
- Output `.obj` file: `01_eigen_colormap.obj`.

---

## Acknowledgements

Developed by:  
- **Angel Raphael**  
- **B Jayalakshmi**  
- **Ganga SajeevKumar**  
- **Gouri Krishna S**  

Project Guide: Prof. Bincy P Mathew  
College of Engineering, Trivandrum
