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

C = textread('Vm_AtONENode_OverALLTime.txt');
mat_size = size(C);
space = linspace(0,mat_size(2)-1,305);


figure(3)
clf
suptitle('Spatial plots of Vm at node 11 (center node, under electrode)')
for i=2:mat_size(1)
    subplot(5,2,i-1)
    plot(space,C(i,1:305),'LineWidth',2)
    fixplot()
    str{i} = sprintf('t = %0.2f',((i-2)*50)*0.025);
    title(str{i})
    xlabel('Length of Peripheral Process, µm')
    ylabel('Vm, mV')
    axis([0 2680 min(min(C(2:end,:))) max(max(C(2:end,:)))])
    hold all
end
%legend(str)