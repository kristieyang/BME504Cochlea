%% Activation Plot
%% BME504 Project (dn mn ky)

clear; clc;
thresh =0; %mV
%currvals = abs([-0.28,-.3,-.2,-.1,-.15,-.17,-.16,-.18,-.19,-.22,0,-.24,...
%    -.26,-.32,-.34,-.36,-.4,-.45,-.55,-.75,-1,-1.2,-1.5,-2,-2.2,-2.5,-3.2,-3.5,-4,-4.5]); %mA
currvals = abs(dlmread('LogSpace.txt', ' '));
DataLoc = '~/Documents/BME\ 504/Cochlea';
%cd(DataLoc)
APmycheck = 0;
APuncheck = 0;

% Myl File Loop

myfilelist=dir('VmM_MatrixT*.txt');
num_myfibers_AP = zeros(length(myfilelist),1);
for mycount = 1:length(myfilelist); 
    eval(['load ' myfilelist(mycount).name ' -ascii']);
    if mycount < 10
        eval(['DataM = VmM_MatrixT0' num2str(mycount) ';']);
    else
        eval(['DataM = VmM_MatrixT' num2str(mycount) ';']);
    end
    ROW = size(DataM,1);
    for fiber = 1:ROW
        vm = DataM(fiber, 190:end);
        VmMax = max(vm);
            if VmMax > thresh
                APmycheck(fiber, mycount) = 1;
            else
                APmycheck(fiber, mycount) = 0;
            end
    end
    num_myfibers_AP(mycount) = sum(APmycheck(:,mycount));
end



clearvars vm Data VmMax ROW

unfilelist = dir('VmU_MatrixT*.txt');
num_unfiber_AP = zeros(length(myfilelist),1);
for uncount = 1:length(unfilelist)
eval(['load ' unfilelist(uncount).name ' -ascii']);
    if uncount < 10
        eval(['DataU = VmU_MatrixT0' num2str(uncount) ';']);
    else
        eval(['DataU = VmU_MatrixT' num2str(uncount) ';']);
    end
    
    ROW = size(DataU,1);
    for fiber = 1:ROW;
        vm = DataU(fiber, 190:end);
        VmMax = max(vm);
            if VmMax >  thresh
                APuncheck(fiber, uncount) = 1;
            else
                APuncheck(fiber, uncount) = 0;
            end
    end
   num_unfiber_AP(uncount) = sum(APuncheck(:,uncount));
end

%num_total_AP = num_unfiber_AP(:)+num_myfiber_AP(:);

for i = 1:length(num_unfiber_AP)
    num_total_AP(i) = num_unfiber_AP(i)+num_myfibers_AP(i);
end

% Plot
f = @(p,x) 1000 + (-1000)./(1 + exp(-(log10(x)-500))/p)
%f = @(p,x) p(1)^2 + p(2) ./ (p(5) + exp(-(x-p(3))/p(4)));
%sigfunc = @(A, x) A(2) + (A(1)./(1 + exp(-(x-A(3)))));
p = nlinfit(currvals,num_total_AP,f,[.001])
%p = polyfit(currvals,num_total_AP,4);
%fit = polyval(p, linspace(.15,5));
xvals = linspace(0.15,5,1000);

figure(1); clf
title('Activation % vs. Cathodic Stimulus Amplitude'); xlabel('Cathodic Stimulus Amplitude'); ylabel('Activation Percentage');
semilogx(currvals, num_total_AP, 'ro', xvals,f(p,xvals),'b-')
