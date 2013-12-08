%% Activation Plot
%% BME504 Project (dn mn ky)

clear; clc;
thresh =0; %mV
currvals = [-0.03]; %mA
DataLoc = '~/Documents/BME\ 504/Cochlea';
%cd(DataLoc)
APmycheck = 0;
APuncheck = 0;

% Myl File Loop

myfilelist=dir('VmM_Matrix*');
for mycount = 1:length(myfilelist);
eval(['load ' myfilelist(mycount).name ' -ascii']);
eval(['DataM = VmM_Matrix' num2str(mycount) ';']);

    for fiber = 1: 100
        vm = DataM(fiber, :);
        VmMax = max(vm);
            if VmMax >  thresh
                APmycheck(fiber, mycount) = 1;
            else
                APmycheck(fiber, mycount) = 0;
            end
    end
    num_myfibers_AP(mycount,1) = sum(APmycheck)
end



clearvars vm Data VmMax

unfilelist = dir('VmU_Matrix*');
for uncount = 1:length(unfilelist)
eval(['load ' unfilelist(uncount).name ' -ascii']);
eval(['DataU = VmU_Matrix' num2str(uncount) ';']);

    for fiber = 1: 100
        vm = DataU(fiber, :);
        VmMax = max(vm);
            if VmMax >  thresh
                APuncheck(fiber, uncount) = 1;
            else
                APuncheck(fiber, uncount) = 0;
            end
    end
   num_unfiber_AP(uncount,1) = sum(APuncheck)
end

%num_total_AP = num_unfiber_AP(:)+num_myfiber_AP(:);

for i = 1:length(num_unfiber_AP)
    num_total_AP(i) = num_unfiber_AP(i)+num_myfibers_AP(i);
end

% Plot

p = polyfit(currvals,num_total_AP,4);
fit = polyval(p, linspace(-.35,0));

figure(1); clf
title('Activation % vs. Cathodic Stimulus Amplitude'); xlabel('Cathodic Stimulus Amplitude'); ylabel('Activation Percentage');
plot(currvals, num_total_AP, 'ro', linspace(-0.35,0),fit,'b-')
