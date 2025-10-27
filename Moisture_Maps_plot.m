% Authors: Bikram Koirala and Danish Ali Chaghdo - Date: 06/10/2025

% If you use this code to estimate the moisture content, 
% please cite this paper: B. Koirala, Z. Zahiri and P. Scheunders, 
% "A Robust Supervised Method for Estimating Soil Moisture Content 
% From Spectral Reflectance",in IEEE Transactions on Geoscience and Remote Sensing, 
% vol. 60, pp. 1-13, 2022, Art no. 5539813, doi: 10.1109/TGRS.2022.3212600

clc
clear
close all

addpath(genpath('.'))
%% Loading the dataset (Big Samples)
[data_dry_big,text_dry_big]= reading_matfiles('Dry_Big');

[data_25_big,text_25_big]= reading_matfiles('25_sat_Big');

[data_50_big,text_50_big]= reading_matfiles('50_sat_Big');

[data_75_big,text_75_big]= reading_matfiles('75_sat_Big');

[data_90_big,text_90_big]= reading_matfiles('90_sat_Big');

[data_100_big,text_100_big]= reading_matfiles('100_sat_Big');

%% Collecting the dataset (Big) - 36 samples and 6 sat_Levels
Data_all_Big{1} = data_dry_big;
Data_all_Big{2} = data_25_big;
Data_all_Big{3} = data_50_big;
Data_all_Big{4} = data_75_big;
Data_all_Big{5} = data_90_big;
Data_all_Big{6} = data_100_big;
text = ["Dry","25","50","75","90","100"];

names = ["B1","B2","B3","B4","B5","B6",...
    "E1","E2","E3","E4","E5","E6",...
    "M1","M2","M3","M4","M5","M6",...
    "N1","N2","N3","N4","N5","N6",...
    "OB1","OB2","OB3","OB4","OB5","OB6",...
    "S1","S2","S3","S4","S5","S6"];

load Ground_Truth GT_100_big GT_90_big GT_75_big GT_50_big GT_25_big

GT_100_big = GT_100_big*100;
GT_90_big = GT_90_big*100;
GT_75_big = GT_75_big*100;
GT_50_big = GT_50_big*100;
GT_25_big = GT_25_big*100;

Data_all{1} = data_dry_big;
Data_all{2} = data_25_big;
Data_all{3} = data_50_big;
Data_all{4} = data_75_big;
Data_all{5} = data_90_big;
Data_all{6} = data_100_big;

GT_all{1} = zeros(36,1);
GT_all{2} = GT_25_big;
GT_all{3} = GT_50_big;
GT_all{4} = GT_75_big;
GT_all{5} = GT_90_big;
GT_all{6} = GT_100_big;

for i=1:36  
   for j=1:6
        temp{j} = Data_all{j}{i};
        temp1(j) = GT_all{j}(i,1);
    end
    Data_collect{i} = temp;
    GT_collect{i} = temp1;
end

clear Data_all
clear GT_all
%% Water content Big Samples 

for i=1:size(Data_collect,2)

    for j=1:6

        Data_collect_spectra{j} = Data_collect{i}{j};

        GT(j) = GT_collect{i}(j);

    end
    GT_all(:,i) = GT;
 
    dry = mean(reshape_spec(Data_collect_spectra{1}),2);
    sat = mean(reshape_spec(Data_collect_spectra{end-1}),2);

    for j=1:size(Data_collect_spectra,2)

        [data,a,b] = reshape_spec(Data_collect_spectra{j});

        abun = estimate_geo_abundance_spherical_exact_final(data,[dry,sat]);
        abun = abun(2,:)*GT(end-1);
        
        T_B{j} = reshape(abun,[a,b]);

    end


    water_content_map_Big{i} = T_B;


end
%% Loading the dataset (Small Samples)
[data_dry_Small,text_dry_Small]= reading_matfiles('Dry_Small');

[data_25_Small,text_25_Small]= reading_matfiles('25_sat_Small');

[data_50_Small,text_50_Small]= reading_matfiles('50_sat_Small');

[data_75_Small,text_75_Small]= reading_matfiles('75_sat_Small');

[data_90_Small,text_90_Small]= reading_matfiles('90_sat_Small');

[data_100_Small,text_100_Small]= reading_matfiles('100_sat_Small');

%% Collecting the dataset (Small) - 36 samples and 6 sat_Levels
Data_all_Small{1} = data_dry_Small;
Data_all_Small{2} = data_25_Small;
Data_all_Small{3} = data_50_Small;
Data_all_Small{4} = data_75_Small;
Data_all_Small{5} = data_90_Small;
Data_all_Small{6} = data_100_Small;
text = ["Dry","25","50","75","90","100"];

names = ["b1","b2","b3","b4","b5","b6",...
    "e1","e2","e3","e4","e5","e6",...
    "m1","m2","m3","m4","m5","m6",...
    "n1","n2","n3","n4","n5","n6",...
    "ob1","ob2","ob3","ob4","ob5","ob6",...
    "s1","s2","s3","s4","s5","s6"];

load Ground_Truth_small GT_100_small GT_90_small GT_75_small GT_50_small GT_25_small

GT_100_small = GT_100_small*100;
GT_90_small = GT_90_small*100;
GT_75_small = GT_75_small*100;
GT_50_small = GT_50_small*100;
GT_25_small = GT_25_small*100;

Data_all_small{1} = data_dry_Small;
Data_all_small{2} = data_25_Small;
Data_all_small{3} = data_50_Small;
Data_all_small{4} = data_75_Small;
Data_all_small{5} = data_90_Small;
Data_all_small{6} = data_100_Small;

GT_all_small{1} = zeros(36,1);
GT_all_small{2} = GT_25_small;
GT_all_small{3} = GT_50_small;
GT_all_small{4} = GT_75_small;
GT_all_small{5} = GT_90_small;
GT_all_small{6} = GT_100_small;

for i=1:36  
   for j=1:6
        temp_small{j} = Data_all_small{j}{i};
        temp1_small(j) = GT_all_small{j}(i,1);
    end
    Data_collect_small{i} = temp_samll;
    GT_collect_small{i} = temp1_samll;
end

clear Data_all
clear GT_all

%% Water content - Small Samples 

for i=1:size(Data_collect,2)

    for j=1:6

        Data_collect_spectra_small{j} = Data_collect_small{i}{j};

        GT_small(j) = GT_collect_small{i}(j);

    end
    GT_all_small(:,i) = GT;
 
    dry_small = mean(reshape_spec(Data_collect_spectra_small{1}),2);
    sat_small = mean(reshape_spec(Data_collect_spectra_small{end-1}),2);

    for j=1:size(Data_collect_spectra,2)

        [data_small,a_small,b_small] = reshape_spec(Data_collect_spectra{j});

        abun_small = estimate_geo_abundance_spherical_exact_final(data,[dry_small,sat_small]);
        abun_small = abun_small(2,:)*GT(end-1);
        
        T_B_small{j} = reshape(abun_small,[a_small,b_small]);

    end


    water_content_map_small{i} = T_B_small;


end
%% Plot MMpas
Sat_Levels = {"Dry", "25", "50", "75", "90", "100"};

% Set the sample index and title
sample_idx = 2;
figure_title = 'Moisture Maps of Sample B2';

% Create a vertically stretched figure with fixed pixel size
figure_handle = figure('Units', 'pixels', 'Position', [100, 100, 1000, 700]);

% Loop through saturation levels and create subplots
for j = 1:numel(Sat_Levels)
    subplot(2, 3, j);
    
    % Get and transform the image:
    img = water_content_map{sample_idx}{j}; % Replace it with water_content_map_small to plot the MMaps for the small samples
    img_flipped = fliplr(img);  % Horizontal flip only

    % Display transformed image
    imagesc(img_flipped);
    
    % Apply reversed 'jet' colormap
    cmap = colormap('jet');
    cmap = flipud(cmap);
    colormap(cmap);
    
    % Turn off axis ticks and box
    axis off;
    
    % Add colorbar with label
    cb = colorbar;
    cb.Label.String = 'MC (g/g x 100)';
    cb.Label.FontSize = 10;
    cb.Label.FontWeight = 'bold';
    cb.FontSize = 9;

    % Set consistent color limits
    set(gca, 'CLim', [0, GT_collect{sample_idx}(end)]);
    
    % Add subplot title with saturation level (now bold)
    title(Sat_Levels{j}, 'FontSize', 10, 'FontWeight', 'bold');
end

% Add overall figure title
sgtitle(figure_title, 'FontSize', 12, 'FontWeight', 'bold');



