function [] = moveTo(x, y, z, motors)
    a = 160; % x offset (mm)
    b = 80; % y offset (mm)
    c = 30; % z offset (mm)
    
    L = 8; % arm 1 length (mm)
    M = 150; % arm 2 length (mm)
    N = 150; % arm 3 length (mm)
    P = 50; % pen length (mm)    
    alpha = 45; % pen degree constant (degrees)
    
    N = sqrt(N^2 + P^2 - 2*N*P*cosd(alpha)); % Calculate effective N
    beta = asind(P*sind(alpha)/N);
    x = 32*x-16; % Convert co-ordinate to mm
    y = 32*y-16; % Convert co-ordinate to mm
    z = 19*z; % Convert co-ordinate to mm
    
    %%KINEMATICS
    if x==a 
        theta1 = 90;
    else
        theta1 = atand((y+b)/(x-a));
    end
    
    if theta1<0
        theta1 = 180 + theta1;
    end
    
    l=(y+b)/sind(theta1) - L;
    t = sqrt(l^2+(z-c)^2);
    phi1 = acosd((t^2+M^2-N^2)/(2*M*t));
    phi2 = atand((z-c)/l);
    theta2 = phi1 + phi2;
    theta3 = acosd((M^2+N^2-t^2)/(2*M*N)) + beta;
    
    theta1 = round(theta1)
    theta2 = round(theta2)
    theta3 = round(theta3)
    
    %% move to angles
    mA = motors(1,1);
    mB = motors(1,2);
    mC = motors(1,3);
    
    data = mA.ReadFromNXT();
    pos  = data.Position;
    mA.TachoLimit = theta1 + pos;
    mA.SendToNXT();
    mA.WaitFor();
    
    data = mB.ReadFromNXT();
    pos  = data.Position;
    mB.TachoLimit = theta2 + pos;
    mB.SendToNXT();
    mB.WaitFor();
    
    data = mC.ReadFromNXT();
    pos  = data.Position;
    mC.TachoLimit = theta3 + pos;
    mC.SendToNXT();
    mC.WaitFor();
    
    mA.Stop('off');
    mB.Stop('off');
    mC.Stop('off');
%         
end