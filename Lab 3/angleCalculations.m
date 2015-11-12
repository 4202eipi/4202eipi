function [ theta ] = angleCalculations( x, y, z )
%ANGLE_CALCULATIONS Calculate the angles the four motors should be pointing at
% x, y and z should be in mm from the origin

    M = 115; % Arm 1 length in mm
    N = 234; % Arm 2 length in mm
    O = 150; % Arm 3 length in mm
    c = 128; % vertical offset in mm
    h = 500; % mount of arm's "base"
    
    M = 266; % Change Arm 1 to current arm 2 plus 36mm
    %M = 115;
    M = 116;
    N = 176; % Extend Arm 2 by approx 75mm (after swapping with arm 1)
    N = 390;%-73;
    %N = 115;
    O = 185; % Pen arm
    c = 128; % Extend this by about 60mm (reason being: motor 2 angle)
    h = 480; %
    
    a = 15;%192/2;
    b = 192/2;%10; % Need to be back 15cm
    
    x = x + a;
    y = y - b;
    
    if x==0
        theta(1) = 90;
    else
        theta(1) = atand(x/-y);
    end
    if theta(1)<0
        theta(1) = theta(1) + 180;
    end
    l = sqrt(x^2+y^2);
    
    
    %P = sqrt(l^2 + (h-z-c)^2);
    %Q = sqrt(l^2 + (O+z+c-h)^2);
    %phi_2 = acosd((M^2+Q^2-N^2)/(2*M*Q));
    %gamma_2 = acosd((Q^2+P^2-O^2)/(2*Q*P));
    %beta_2 = acosd((l^2+P^2-(h-z-c)^2)/(2*l*P));
    %theta(2) = phi_2 + gamma_2 - beta_2;
    %theta(3) = acosd((M^2+N^2-Q^2)/(2*M*N));
    %phi_4 = acosd((N^2+Q^2-M^2)/(2*N*Q));
    %gamma_4 = acosd((Q^2+O^2-P^2)/(2*Q*O));
    %theta(4) = phi_4 + gamma_4;
    
    O = h-z-c;
    P = sqrt(l^2+O^2);
    gamma_2 = acosd((M^2+P^2-N^2)/(2*M*P));
    beta_2 = acosd((l^2+P^2-O^2)/(2*l*P));
    theta(2) = gamma_2 - beta_2;
    theta(3) = acosd((M^2+N^2-P^2)/(2*M*N));
end

