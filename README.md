# SWIR Hyperspectral Dataset of moist stone samples to estimate the moisture content 
In this work, we have created an extensive SWIR hyperspectral dataset which contains hyperspectral images and corresponding moisture maps of six porous building materials: five natural stones (Euville, Massangis, Neubrunner, Obernkirchener, and Savonnières) and one archaeological red brick. For each material, six replicate specimens measuring approximately 6 × 6 × 6 cm³ were prepared. From each sample cube, a small cylindrical sub-sample was extracted to study spatial heterogeneity. In total, 36 sample cubes and 36 cylindrical sub-samples were produced. Moisture levels were carefully controlled across five target saturation states (25%, 50%, 75%, 90%, and 100%). Hyperspectral images were acquired using an Imec Snapscan SWIR camera (1100–1670 nm nominal range, ~5 nm mean spectral resolution) under uniform lighting and consistent positioning. Each hyperspectral cube contains 100 spectral bands, with wavelengths ranging from 1120.5 nm (first band) to 1675.1 nm (last band). The band interval varies between 0.32 nm and 15.37 nm, with a mean spacing of approximately 5.6 nm. For large samples, the original image cubes were 400 × 400 pixels, including both sample and background. To isolate only the sample area, images were cropped, resulting in final cube sizes ranging from 286 × 210 to 391 × 384 pixels.
This is an open-source dataset. If you use it in your work, please cite the DOI: 10.5281/zenodo.17398900. 

The Dataset Structure is as follows:
The data is provided in a compressed archive (HSI_Moisture_Dataset.zip) containing two main folders:

HS_Images/ – hyperspectral reflectance data
Moisture_Maps/ – corresponding moisture maps

Each folder has two subfolders: Big (sample cubes) and Small (cylindrical sub-samples). Within each, six folders represent the saturation levels (Dry, 25%, 50%, 75%, 90%, 100%). Each folder contains .mat files for all samples, named with the material code, replicate number, saturation level, and sample type. Examples:

B1_sat_25_Big.mat – Brick, replicate 1, 25% saturation, large sample
E3_sat_75_Small.mat – Euville, replicate 3, 75% saturation, small sample
Material codes:

B – Brick
E – Euville
M – Massangis
N – Neubrunner
OB – Obernkirchener
S – Savonnières
Each .mat file contains either hyperspectral reflectance data or moisture map data for the corresponding sample and saturation condition.

The journal paper describing the dataset in detail and a method to estimate MC from spectral reflectance is currently under submission. The DOI of the paper will be included once published.
