function [ theta_1, theta_2, theta_3, theta_4 ] = angle_calculations( x, y, z )
%MOVETO Calculate the angles the four motors should be pointing at
% x, y and z should be in mm from the origin

    M = 10; % Arm 1 length in mm
    N = 10; % Arm 2 length in mm
    O = 10; % Arm 3 length in mm
    c = 20; % vertical offset in mm
    
    theta_1 = tand(y/x);
    l = sqrt(x^2+y^2);
    P = sqrt(l^2 + (z-c)^2);
    Q = sqrt(l^2 + (z+O-c)^2);
    phi_2 = acosd((M^2+Q^2-N^2)/(2*M*Q));
    gamma_2 = acosd((Q^2+P^2-O^2)/(2*Q*P));
    beta_2 = acosd((l^2+P^2-(c-z)^2)/(2*l*P));
    theta_2 = phi_2 + gamma_2 - beta_2;
    theta_3 = acosd((M^2+N^2-Q^2)/(2*M*N));
    phi_4 = acosd((N^2+Q^2-M^2)/(2*N*Q));
    gamma_4 = acosd((Q^2+(O+z-c)^2-l^2)/(2*Q*(O+z-c)));
    theta_4 = phi_4 + gamma_4;
    
end

