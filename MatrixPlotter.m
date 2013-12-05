clear;
A = textread('Ve_AtNode_OverTime.txt');
time = linspace(0,10,length(A)-1);

figure(1)
clf
for i=1:21
    plot(time,A(2:end,i),'LineWidth',2)
    str{i} = sprintf('%0.0f node',i)
    hold all
end
title('Extracellular Potential at Nodes Induced by Extracellular Electrode')
ylabel('Extracellular Potential, mV')
xlabel('Time, ms')
legend(str)
fixplot()



B = textread('Vm_AtNode_OverTime.txt');
time = linspace(0,10,length(B)-1);

figure(2)
clf
for i=1:20
    %subplot(7,3,i)
    plot(time,B(2:end,i),'LineWidth',2)
    str{i} = sprintf('%0.0f node',i)
    %title(str{i})
    axis([0 10 min(min(B(2:end,:))) max(max(B(2:end,:)))])
    hold all
end

max(B(:))

legend(str)

%C = dlmread('Vm_AtONENode_OverALLTime.txt','t',1);
C = textread('Vm_AtONENode_OverALLTime.txt');
mat_size = size(C);
space = linspace(0,2680,matsize(2));

figure(3)
clf
plot(space,C(i,:),'LineWidth',2)


suptitle('Spatial plots of Vm at node 11 (center node, under electrode)')
for i=2:mat_size(1)-1
    subplot(5,2,i-1)
    plot(space,C(i,:),'LineWidth',2)
    %fixplot()
    %str{i} = sprintf('t = %0.2f',((i-2)*50)*0.025);
    %title(str{i})
    %xlabel('Length of Peripheral Process, µm')
    %ylabel('Vm, mV')
    %axis([0 2680 min(min(C(2:end,:))) max(max(C(2:end,:)))])
end
%legend(str)

% %% BME504: Cochlea Course Project
% % Daria Nesterovich, Matt Nagle, Kristie Yang
% % Extracellular electrode voltages
% 
% 
% %% Define Fiber Parameters
% D     = 1.4;      %um
% d     = 0.7*D;    %um
% L     = 100*D;    %um
% l     = 1.0;      %um
% Iext  = -.1;      %mA
% rho_e = 70*10^4;  %Ohm-um, From Cartee et al. 2006
% 
% %% Define Electrode Mesh Parameters
% 
% Ymax = 500;         %um, Distance between electrode and fiber
% Xmax = l*20+L*19;   %um, Length of entire fiber
% 
% numpoints=100;
% [X,Y] = meshgrid(linspace(0,Xmax,2680),linspace(0,Ymax,200));
% 
% ElecPos = [1419,100];
% 
% r = sqrt((X-ElecPos(1)).^2 + (Y-ElecPos(2)).^2);
% 
% Ve = (Iext.*rho_e)./(4.*pi.*r);
% 
% figure(4);clf
% subplot(2,1,2)
% imagesc(log(Ve/max(Ve(:))))
% axis square
% fixplot
% pbaspect('manual');pbaspect([1 Ymax/Xmax 1]);
% view([0 90])
% xlabel('Dist along Peripheral Process (\mum)')
% ylabel('Dist from Peripheral Process (\mum)')
% zlabel('Extracellular Potential, Ve (mV)')
% title('Scaled Extracellular Potential, created by point source electrode')
% 
% subplot(2,1,1)
% Vec = [-3.943539,-4.3794799,-4.9233568,-5.620683,-6.5465335,-7.8338955,...
%     -9.741703, -12.844354,-18.676193,-32.377426, -55.701445, -32.073305,... 
%     -18.558903, -12.786967, -9.7082684, -7.8121402, -6.5312881, -5.6094206,...
%     -4.9147031,-4.3726256];
% 
% x = 0:141:2680
% plot(x,Vec,'bo-')
% fixplot()
% xlabel('Dist along Peripheral Process (\mum)')
% ylabel('Extracellular Potential, Ve (mV)')
% title('Extracellular Potential at Each Node, created by point source electrode')
% axis([0 2680 -60 0])
% 
% % E = textread('SuccessfulExStim.txt');
% % figure(5)
% % clf
% % subplot(3,1,1)
% % plot(x,Vec,'bo-')
% % fixplot()
% % xlabel('Dist along Peripheral Process (\mum)')
% % ylabel('Extracellular Potential, Ve (mV)')
% % title('Extracellular Potential at Each Node, created by point source electrode')
% % axis([0 2680 -60 0])
% % 
% % j=1
% % FirstDiff = (Vec(j+1)-Vec(j))/141
% % for j=2:length(Vec)-1
% %     FirstDiff(j) = (Vec(j-1)-2*Vec(j)+Vec(j+1))/282
% % end
% % FirstDiff(j+1) = (Vec(j+1)-Vec(j))/141
% % 
% % j=1
% % SecondDiff = (FirstDiff(j+1)-FirstDiff(j))/141
% % for j=2:length(FirstDiff)-1
% %     SecondDiff(j) = (FirstDiff(j-1)-2*FirstDiff(j)+FirstDiff(j+1))/282
% % end
% % SecondDiff(j+1) = (FirstDiff(j+1)-FirstDiff(j))/141
% % 
% % subplot(3,1,2)
% % plot(0:141:2680, SecondDiff,'bo-')
% % fixplot()
% % axis([0 2680 -0.002 0.001])
% % title('Second Difference Induced by Extracellular Stimulation')
% % xlabel('Time, ms')
% % ylabel('Second Difference, mV/µm^2')
% % 
% % subplot(3,1,3)
% % plot(E(:,1),E(:,2))
% % fixplot()
% % title('Action Potential Induced at Node 11 (central node)')
% % xlabel('Time, ms')
% % ylabel('Membrane Voltage, mV')