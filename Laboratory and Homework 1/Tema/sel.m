function [x,y,z] = sel(a1,b1,c1,a2,b2,c2,a3,b3,c3,a0,b0,c0)

A = [a1 b1 c1; a2 b2 c2; a3 b3 c3];

if(det(A) ~= 0)
    Ax = [a0 b1 c1; b0 b2 c2; c0 b3 c3];
    Ay = [a1 a0 c1; a2 b0 c2; a3 c0 b3];
    Az = [a1 b1 a0; a2 b2 b0; a3 b3 c0];
    x = det(Ax)/det(A);
    y = det(Ay)/det(A);
    z = det(Az)/det(A);
end

end