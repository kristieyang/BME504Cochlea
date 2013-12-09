% BME504

A = dlmread('StrengthDistM.txt');
Dist = A(:,1);
Mye= A(:,2);
Un= A(:,3);

figure(1)
clf
semilogx(Dist,abs(Un),'k-s','MarkerFaceColor','k')
hold on
semilogx(Dist,abs(Mye),'k-o','MarkerFaceColor','k')
hold off
title('Strength Distance Curve')
legend('Unmyelinated Peripheral Process','Myelinated Peripheral Process')
ylabel('Stimulus Threshold (mA)')
xlabel('Distance from Fiber (µm)')
axis()