function [angles_new, leftRight] = moveTo(x, y, z, angles, motors, leftRight)
    a = 164; % x offset (mm)
    b = 80; % y offset (mm)
    c = 86.66; % z offset (mm)

    L = 8;
    M = 160; % arm 1 length (mm)
    N = 48; % arm 2 length (mm)
    P = 115; % pen length (mm)
    alpha = 135; % pen degree constant (degrees) ???

    x = 32*x-16; % Convert co-ordinate to mm
    y = 32*y-16; % Convert co-ordinate to mm
    z = 20*z; % Convert co-ordinate to mm
    
    if x==a 
        theta1 = 0;
    elseif x>a
        theta1 = atand((y+b)/(x-a)) - 90;
    else
        theta1 = 90 - atand((y+b)/(a-x));
    end
    
    % Compensation for position of motor 1
    y = y-L*cos(theta1);
    x = x-L*sin(theta1);

    O = sqrt(N^2 + P^2 - 2*N*P*cosd(alpha)); % Calculate effective N
    l = sqrt((y+b)^2+(x-a)^2);
    r = sqrt(l^2+(z-c)^2);
    phi2 = atand((z-c)/l);
    beta2 = acosd((M^2+r^2-O^2)/(2*M*r)) ;
    theta2 = beta2 + phi2;
    phi3 = acosd((N^2 + O^2 - P^2)/(2*N*O));
    beta3 = acosd((M^2 + O^2 - r^2)/(2*M*O));
    theta3 = phi3 + beta3;
    
    
    theta2 = 90 - theta2;
    theta3 = 180 - theta3;
    
    % Return the new angles
    angles_new = [theta1, theta2, theta3];
    
    % Compensate for angles that the motors are already pointing at
    theta1 = theta1 - angles(1);
    theta2 = theta2 - angles(2);
    theta3 = theta3 - angles(3);
    
    % Move the motors
    leftRight = moveMotors([theta1, theta2, theta3], motors, leftRight);
end