function[] = resetArms(motors)
%% Reset angles
    mALeft = motors(1,1);
    mBDown = motors(1,2);
    mCDown = motors(1,3);

    mARight = motors(2,1);
    mBUp = motors(2,2);
    mCUp = motors(2,3);
    
    data = mARight.ReadFromNXT();
    pos  = data.Position;
    
    if pos > 0
        mARight.TachoLimit = pos;
        mARight.SendToNXT();
    else
        mALeft.TachoLimit = -pos;
        mALeft.SendToNXT();
    end
    
    data = mCUp.ReadFromNXT();
    pos  = data.Position;
    mCUp.TachoLimit = pos;
    mCUp.SendToNXT();
 
    data = mBUp.ReadFromNXT();
    pos  = data.Position;
    mBUp.TachoLimit = -1 * pos;
    mBUp.SendToNXT();
   
    mARight.WaitFor();
    mBUp.WaitFor();
    mCUp.WaitFor();
    
    mARight.Stop('off');
    mBUp.Stop('off');
    mCUp.Stop('off');  
end 