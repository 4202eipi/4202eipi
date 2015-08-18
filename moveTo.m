function [] = moveTo(x, y, z, motors)
    a = 164; % x offset (mm)
    b = 80; % y offset (mm)
    c = 82; % z offset (mm)

    M = 158; % arm 1 length (mm)
    N = 72; % arm 2 length (mm)
    P = 112; % pen length (mm)    
    alpha = 135; % pen degree constant (degrees)

    gr1 = 7; %gear ratio motorA:arm1
    gr2 = 6; %gear ratio motorB:arm2

    N = sqrt(N^2 + P^2 - 2*N*P*cosd(alpha)); % Calculate effective N
    phi = asind(P*sind(alpha)/N);
    %phi = 28.5
    x = 32*x-16; % Convert co-ordinate to mm
    y = 32*y-16; % Convert co-ordinate to mm
    z = 19*z; % Convert co-ordinate to mm8
    %%KINEMATICS
    if x==a 
        theta1 = 0;
    elseif x < a
        theta1 = 90 - atand((y+b)/(a-x));
    else
        theta1 = - atand((y+b)/(x-a));
    end

    l = sqrt((y+b)^2+(x-a)^2);
    r = sqrt(l^2+z^2);
    omega = atand(z/l);
    d = sqrt(c^2 + r^2 - 2*c*r*cosd(90-omega));
    
    theta2 = acosd((M^2+d^2-N^2)/(2*M*d));
    temp = theta2;
    %beta = asind(d/N*sind(temp));
    beta = acosd((N^2 + M^2 - d^2)/(2*N*M));
    theta3 = beta + phi;
    
    theta1 = round(gr1*(theta1-3))
    theta2 = round(gr2*(90-theta2))
    theta3 = round(180 - theta3)
    
    %hard code
   % theta1 = 394
    %theta2 = 276
    %theta3 = 79
    
    
    %% move to angles
    
    moveMotors([theta1, theta2, theta3], motors);
%     mALeft = motors(1,1);
%     mBDown = motors(1,2);
%     mCDown = motors(1,3);
%     
%     mARight = motors(2,1);
%     mBUp = motors(2,2);
%     mCUp = motors(2,3);
%     
%     data = mALeft.ReadFromNXT();
%     pos  = data.Position
%     if theta1 > pos
%         mALeft.TachoLimit = abs(theta1);
%         mALeft.SendToNXT();
%         mALeft.WaitFor();
%     else 
%         mARight.TachoLimit = abs(theta1);
%         mARight.SendToNXT();
%         mARight.WaitFor();
%     end
%    
%  
%     data = mCDown.ReadFromNXT();
%     pos  = data.Position
%     if theta3 > pos;
%         mCDown.TachoLimit = theta3-pos;
%         mCDown.SendToNXT();
%         mCDown.WaitFor();
%     else
%         mCUp.TachoLimit = theta3;
%         mCUp.SendToNXT()
%         mCUp.WaitFor();
%     end
%     
%     data = mBDown.ReadFromNXT();
%     pos  = data.Position;
%     if theta2 > pos;
%         mBDown.TachoLimit = theta2-pos;
%         mBDown.SendToNXT();
%         mBDown.WaitFor();
%     else
%         mBUp.TachoLimit = theta2;
%         mBUp.SendToNXT();
%         mBUp.WaitFor();
%     end
%     
%     mALeft.Stop('off');
%     mBDown.Stop('off');
%     mCDown.Stop('off');         
end