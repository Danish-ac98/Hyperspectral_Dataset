# Hyperspectral Dataset
In this work, we have created an extensive SWIR hyperspectral dataset which contains hyperspectral images of six porous building materials: five natural stones (Euville, Massangis, Neubrunner, Obernkirchener, and Savonnières) and one archaeological red brick. For each material, six replicate specimens measuring approximately 6 × 6 × 6 cm³ were prepared. From each sample cube, a small cylindrical sub-sample was extracted to study spatial heterogeneity. In total, 36 sample cubes and 36 cylindrical sub-samples were produced. Moisture levels were carefully controlled across five target saturation states (25%, 50%, 75%, 90%, and 100%). Hyperspectral images of both moist and dry samples were acquired using an Imec Snapscan SWIR camera (1100–1670 nm, ~5 nm spectral resolution), under uniform lighting and consistent positioning.
This is an open-source dataset. If you use it in your work, please cite the DOI: 10.5281/zenodo.15304416. 

The Dataset Structure is as follows:
The data is provided in a compressed archive (HSI_Dataset.zip) containing two main folders:
Big_Samples/
Small_Samples/
Each of these folders includes seven subfolders corresponding to the six moisture saturation levels (0%, 25%, 50%, 75%, 90%, and 100%) and groundtruth. Within each saturation subfolder, you will find 36 .mat files—one for each sample. Files are named using a code that identifies the material and replicate number. For example, B2.mat refers to the second replicate of the brick sample. Material codes used are:

B – Brick
E – Euville
M – Massangis
N – Neubrunner
OB – Obernkirchener
S – Savonnières
Each .mat file contains the hyperspectral reflectance data and wavelength information of the image for the specific sample and saturation condition.


The journal paper describing the dataset in detail and a method to estimate MC from spectral reflectance is currently under submission. The DOI of the paper will be included once published.
