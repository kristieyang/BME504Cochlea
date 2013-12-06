function [x,y,z] = neuronpos(x0,y0,z0,l,L,nnode);
    x = x0.*ones(1,nnode);
    y = y0.*ones(1,nnode);
    z = zeros(1,nnode);
    
    z(1) = z0;
    for k = 1:nnode-1
        z(k+1) = z0+(l*(k+1)+L*k);
    end
end