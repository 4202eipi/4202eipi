function [] = moveTo(x, y, z, motors)
    a = 160; % x offset (mm)
    b = 90; % y offset (mm)
    c = 75; % z offset (mm)

    M = 158; % arm 1 length (mm)
    N = 90; % arm 2 length (mm)
    P = 100; % pen length (mm)    
    alpha = 145; % pen degree constant (degrees)

    gr1 = 7; %gear ratio motorA:arm1
    gr2 = 4.5; %gear ratio motorB:arm2

    N = sqrt(N^2 + P^2 - 2*N*P*cosd(alpha)); % Calculate effective N
    phi = asind(P*sind(alpha)/N);
    x = 32*x-16; % Convert co-ordinate to mm
    y = 32*y-16; % Convert co-ordinate to mm
    z = 19*z; % Convert co-ordinate to mm

    %%KINEMATICS
    if x==a 
        theta1 = 0;
    elseif x < a
        theta1 = 90 - atand((y+b)/(a-x));
    else
        theta1 = atand((y+b)/(x-a));
    end

    l = sqrt((y+b)^2+(x-a)^2);
    r = sqrt(l^2+z^2);
    omega = atand(z/l);
    d = sqrt(c^2 + r^2 - 2*c*r*cosd(90-omega));
    
    theta2 = acosd((M^2+d^2-N^2)/(2*M*d));
    temp = theta2;
    beta = asind(d/N*sind(temp));
    
    theta3 = beta + phi;


    theta1 = round(gr1*theta1)
    theta2 = round(gr2*(90-theta2+5))
    theta3 = round(90 - theta3) - 5
    
    
    %% move to angles
    mA = motors(1,1);
    mB = motors(1,2);
    mC = motors(1,3);
    
    data = mA.ReadFromNXT();
    pos  = data.Position;
    mA.TachoLimit = theta1;
    mA.SendToNXT();
    mA.WaitFor();
    
    
    data = mC.ReadFromNXT();
    pos  = data.Position;
    mC.TachoLimit = theta3;
    mC.SendToNXT();
    mC.WaitFor();
    
    data = mB.ReadFromNXT();
    pos  = data.Position;
    mB.TachoLimit = theta2;
    mB.SendToNXT();
    mB.WaitFor();
    
    mA.Stop('off');
    mB.Stop('off');
    mC.Stop('off');         
end