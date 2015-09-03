function motors = setupMotors( power )

    mALeft = NXTMotor('A', 'Power', min(100,2*power));
    mBDown = NXTMotor('B', 'Power', -min(100,power));
    mCDown = NXTMotor('C', 'Power', -min(100,0.5*power));

    mARight = NXTMotor('A', 'Power', -min(100,2*power));
    mBUp = NXTMotor('B', 'Power', min(100,power));
    mCUp = NXTMotor('C', 'Power', min(100,0.5*power));

    motors = [mALeft mBDown mCDown; mARight mBUp mCUp];

    mALeft.SpeedRegulation     = false;
    mALeft.TachoLimit          = 360;
    mALeft.SmoothStart         = true;
    mALeft.ResetPosition();

    mBDown.SpeedRegulation     = false;
    mBDown.TachoLimit          = 360;
    mBDown.SmoothStart         = true;
    mBDown.ResetPosition();

    mCDown.SpeedRegulation     = false;
    mCDown.TachoLimit          = 360;
    mCDown.SmoothStart         = true;
    mCDown.ResetPosition();

    mARight.SpeedRegulation     = false;
    mARight.TachoLimit          = 360;
    mARight.SmoothStart         = true;
    mARight.ResetPosition();

    mBUp.SpeedRegulation     = false;
    mBUp.TachoLimit          = 360;
    mBUp.SmoothStart         = true;
    mBUp.ResetPosition();

    mCUp.SpeedRegulation     = false;
    mCUp.TachoLimit          = 360;
    mCUp.SmoothStart         = true;
    mCUp.ResetPosition();
end

