% Kitty Plot

clear;clf

C = textread('Vm_AtONENode_OverALLTime.txt');
mat_size = size(C);
space = linspace(0,3021,mat_size(2)-1);

figure(1)
clf

suptitle('Spatial plots of Vm at node 11 (center node, under electrode)')
for i=2:mat_size(1)-1
    subplot(5,2,i-1)
    plot(space,C(i,1:mat_size(2)-1),'LineWidth',2)
    fixplot()
    str{i} = sprintf('t = %0.2f',((i-2)*50)*0.025);
    title(str{i})
    xlabel('Length of Peripheral Process, µm')
    ylabel('Vm, mV')
    axis([0 3021 min(min(C(2:end,:))) max(max(C(2:end,:)))])
end