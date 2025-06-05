function MC_samples = estimate_moisture_content(data,E, MC_sat)

% data: Measured spectral reflectances
% E = [E_dry, E_sat]: Endmembers (Dry and Fully saturated samples)
% MC_sat: Moisture content of the saturated sample
% MC_samples: Estimated moisture content of moist samples
 
% If you use this code please do not forget to cite the following paper:
% B. Koirala, Z. Zahiri and P. Scheunders, "A Robust Supervised Method for Estimating Soil Moisture Content From Spectral Reflectance,
% " in IEEE Transactions on Geoscience and Remote Sensing, vol. 60, pp. 1-13, 2022, Art no. 5539813, doi: 10.1109/TGRS.2022.3212600

%% Determining cosine angles between endmembers
    for i=1:2
        for j=1:2
            abunE(i,j) = abs(acos(dot(E(:,i),E(:,j))./(norm(E(:,i))*norm(E(:,j)))));
        end
    end

%% Determining cosine angles between endmembers and measured spectral reflectances 
    for i=1:2
        for j=1:size(data,2)
            abunT(i,j) = abs(acos(dot(E(:,i),data(:,j))./(norm(E(:,i))*norm(data(:,j)))));
        end
    end

 
%% Determining relative positions
    T = abunE(1,2);
 
    for i=1:size(data,2)
        if T<max(abunT(:,i))
            [~,b]=min(abunT(:,i));
            abunT(:,i) = abunE(:,b);
        end
    end
 
    c_das = abunT(2,:);
    c = abunT(1,:);
 
    for i=1:size(data,2)
        abun(1,i)=abs(acos(sin(T)./sqrt((cos(c_das(i))/cos(c(i))-cos(T)).^2+(sin(T))^2)));   
    end
    abun = abun/T;
 
    %% Estimating moisture content
    MC_samples = abun*MC_sat;   
 
end