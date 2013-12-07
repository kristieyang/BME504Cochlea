%% Activation Plot
%% BME504 Project (dn mn ky)

clear; clc;
thresh =0; %mV
currvals = [-0.03]; %mA
DataLoc = '/winhomes/men14/BME504/ProjectData';
cd(DataLoc)
APcheck = 0;

% Current File Loop

currfolderlist=dir('Vm_Node20*');
for currcount = 1:length(currfolderlist);
eval(['load ' currfolderlist(currcount).name ' -ascii']);
eval(['Data = Vm_Node20_Matrix' num2str(currcount) ';']);

    for fiber = 1: 100
        vm = Data(fiber, :);
        VmMax = max(vm);
            if VmMax >  thresh
                APcheck(fiber, currcount) = 1;
            else
                APcheck(fiber, currcount) = 0;
            end


	end
end

num_fibers_AP = sum(APcheck)

% Plot


p = polyfit(currvals,num_fibers_AP,4);
fit = polyval(p, linspace(0, 0.15));

figure(1); clf
title('Activation % vs. Cathodic Stimulus Amplitude'); xlabel('Cathodic Stimulus Amplitude'); ylabel('Activation Percentage');
plot(currvals, num_fibers_AP, 'ro', linspace(0,0.15),fit,'b-')
