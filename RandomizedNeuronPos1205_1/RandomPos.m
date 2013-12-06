% BME504 Cochlea Project
% Generate random position of axons

clear;

%*******************Define variables**************************************
%% Define axon physical properties
D = 1.4;         %µm
l = 1;           %µm
L = 100*D;       %µm
nnode = 21;      %number of nodes
numfibers = 100;   %number of fibers

%% Define electrode position and parameters
XE = 690/2;      %µm
YE = 690/2;      %µm
ZE = 3100;       %µm
   
%% Generate random x and y coordinates for original x,y position
% Chose 690 from Escude et al., 2006
z0 = zeros(1,numfibers);               %z0 is constant, µm
x0 = 690.*rand(1,numfibers);  %generate random x starting points for 100 fibers, µm
y0 = 690.*rand(1,numfibers);  %generate random y starting points for 100 fibers, µm

% Initialize the x and y position vectors
% Each row represents 21 node positions for 1 fiber
xpos = zeros(numfibers,nnode);
ypos = zeros(numfibers,nnode);
zpos = zeros(numfibers,nnode);

for k = 1:numfibers
    [xpos(k,:),ypos(k,:),zpos(k,:)] = neuronpos(x0(k),y0(k),z0(k),l,L,nnode);
end

%% Calculate r positions for every node for every fiber
r = zeros(numfibers,nnode);
for m = 1:numfibers
    for n = 1:nnode
        r(m,n) = sqrt((xpos(m,n)-XE).^2+(ypos(m,n)-YE).^2+(zpos(m,n)-ZE).^2)/(10^4);   %cm
    end
end

% Write data to text file
dlmwrite('rdist.txt',r,'delimiter','\t');
csvwrite('rdistcsv.csv',r);
%% Plotting
figure(1);clf
plot3(xpos(1,:)/(10^4),ypos(1,:)/(10^4),zpos(1,:)/(10^4),'k-')      %cm
hold on
for k = 2:numfibers
    plot3(xpos(k,:)/(10^4),ypos(k,:)/(10^4),zpos(k,:)/(10^4),'k-')  %cm
end
plot3(XE/(10^4),YE/(10^4),ZE/(10^4),'ro')
hold off
xlabel('x (cm)')
ylabel('y (cm)')
zlabel('z (cm)')
title('Randomized axon positions')

figure(2);clf
z = linspace(0,zpos(end)/(10^4),nnode);
plot(z,r(1,:),'ko-')
hold on
for k = 2:numfibers
    plot(z,r(k,:),'ko-')
end
hold off
xlabel('z position (cm)')
ylabel('E2F distance (cm)')
title('Distance between electrode and fiber nodes for 100 fibers')

