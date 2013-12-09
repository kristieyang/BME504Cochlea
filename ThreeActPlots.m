clear; clc;

load 'ActPlot1.mat'
load 'ActPlot2.mat'
load 'ActPlot3.mat'
for i = 1:length(currvals1)
yhat(i) = model1(find(round(xvals1) == currvals1(i)));
end
St = sum((num_total_AP1-mean(num_total_AP1)).^2)
Sr = sum((num_total_AP1-yhat).^2)
r2 = (St-Sr)/St



figure(1); clf
subplot(1,3,1)
semilogx(currvals1, num_total_AP1, 'ro', xvals1, model1,'b-')
title('95% Myelination for 1000 SGCs/mm{^2}');
xlabel('Stimulus Amplitude (cathodic first biphasic) (mA)');
ylabel('Number of SGCs Activated');
axis([0.05 3 0 1000])
subplot(1,3,2)
semilogx(currvals25, num_total_AP25, 'ro', xvals25, model25, 'b-')
title('75% Myelination for 570 SGCs/mm{^2}');
xlabel('Stimulus Amplitude (cathodic first biphasic) (mA)');
ylabel('Number of SGCs Activated');
axis([0.05 3 0 1000])
subplot(1,3,3)
semilogx(currvals50, num_total_AP50, 'ro', xvals50, model50, 'b-')
title('50% Myelination for 570 SGCs/mm{^2}');
xlabel('Stimulus Amplitude (cathodic first biphasic) (mA)');
ylabel('Number of SGCs Activated');
legend('Modeled Data','Piecewise Sigmoidal Fit')
axis([0.05 3 0 1000])