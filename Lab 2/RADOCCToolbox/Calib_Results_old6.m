% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly excecuted under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 520.088771076269720 ; 524.340547435296910 ];

%-- Principal point:
cc = [ 325.333295447123700 ; 294.337471261337900 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.235215598324071 ; -0.387111032803662 ; 0.030145489908111 ; 0.004948526715129 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 6.275641139351759 ; 7.382260417200767 ];

%-- Principal point uncertainty:
cc_error = [ 3.304579777141806 ; 4.866935364347746 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.035913801363771 ; 0.066160583281133 ; 0.008265207734811 ; 0.002359014429962 ; 0.000000000000000 ];

%-- Image size:
nx = 640;
ny = 480;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 12;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ -7.518943e-02 ; 3.822322e-02 ; 1.580954e+00 ];
Tc_1  = [ 1.117849e+02 ; -2.103416e+02 ; 5.148906e+02 ];
omc_error_1 = [ 1.115437e-02 ; 1.057192e-02 ; 1.928945e-03 ];
Tc_error_1  = [ 3.402511e+00 ; 4.747018e+00 ; 6.452481e+00 ];

%-- Image #2:
omc_2 = [ -4.425786e-01 ; 3.661736e-01 ; 1.538582e+00 ];
Tc_2  = [ 1.079670e+02 ; -2.091167e+02 ; 5.588096e+02 ];
omc_error_2 = [ 9.339969e-03 ; 8.852001e-03 ; 3.219585e-03 ];
Tc_error_2  = [ 3.682177e+00 ; 5.110007e+00 ; 6.487327e+00 ];

%-- Image #3:
omc_3 = [ 3.056396e-01 ; -3.621306e-01 ; 1.567194e+00 ];
Tc_3  = [ 1.088864e+02 ; -1.773003e+02 ; 4.773529e+02 ];
omc_error_3 = [ 1.264849e-02 ; 1.211810e-02 ; 2.386641e-03 ];
Tc_error_3  = [ 3.158077e+00 ; 4.428421e+00 ; 5.985630e+00 ];

%-- Image #4:
omc_4 = [ 1.509871e-01 ; 3.462341e-01 ; 1.569407e+00 ];
Tc_4  = [ 1.022841e+02 ; -2.014213e+02 ; 4.767785e+02 ];
omc_error_4 = [ 9.910932e-03 ; 9.993862e-03 ; 2.125217e-03 ];
Tc_error_4  = [ 3.152068e+00 ; 4.435304e+00 ; 6.294313e+00 ];

%-- Image #5:
omc_5 = [ -3.729719e-01 ; -2.556429e-01 ; 1.543252e+00 ];
Tc_5  = [ 1.001669e+02 ; -2.028716e+02 ; 5.580704e+02 ];
omc_error_5 = [ 1.023474e-02 ; 8.857814e-03 ; 2.841284e-03 ];
Tc_error_5  = [ 3.674904e+00 ; 5.118309e+00 ; 6.485558e+00 ];

%-- Image #6:
omc_6 = [ -4.159757e-01 ; 1.257280e-01 ; 1.283190e+00 ];
Tc_6  = [ 7.152498e+01 ; -2.419964e+02 ; 5.662659e+02 ];
omc_error_6 = [ 9.687604e-03 ; 8.507165e-03 ; 2.818934e-03 ];
Tc_error_6  = [ 3.769420e+00 ; 5.174162e+00 ; 6.622100e+00 ];

%-- Image #7:
omc_7 = [ -1.750326e-01 ; 5.513823e-01 ; 1.963818e+00 ];
Tc_7  = [ 1.259788e+02 ; -1.788225e+02 ; 5.165708e+02 ];
omc_error_7 = [ 9.379884e-03 ; 1.030329e-02 ; 3.306700e-03 ];
Tc_error_7  = [ 3.385408e+00 ; 4.770765e+00 ; 6.401455e+00 ];

%-- Image #8:
omc_8 = [ 1.403604e-01 ; -4.775794e-01 ; 1.902537e+00 ];
Tc_8  = [ 1.254981e+02 ; -1.781336e+02 ; 5.032545e+02 ];
omc_error_8 = [ 1.316198e-02 ; 1.286135e-02 ; 2.913188e-03 ];
Tc_error_8  = [ 3.298139e+00 ; 4.683610e+00 ; 6.104434e+00 ];

%-- Image #9:
omc_9 = [ 4.663851e-01 ; -2.375646e-01 ; 1.284273e+00 ];
Tc_9  = [ 7.304959e+01 ; -2.251797e+02 ; 4.399675e+02 ];
omc_error_9 = [ 1.175538e-02 ; 1.075806e-02 ; 2.162518e-03 ];
Tc_error_9  = [ 3.018831e+00 ; 4.158349e+00 ; 5.904527e+00 ];

%-- Image #10:
omc_10 = [ -3.847503e-01 ; 3.533008e-01 ; 1.558722e+00 ];
Tc_10  = [ 9.369878e+01 ; -2.196844e+02 ; 5.604277e+02 ];
omc_error_10 = [ 9.370249e-03 ; 9.197393e-03 ; 3.154235e-03 ];
Tc_error_10  = [ 3.705715e+00 ; 5.125187e+00 ; 6.593893e+00 ];

%-- Image #11:
omc_11 = [ -2.199254e-02 ; 1.054901e-01 ; 1.932732e+00 ];
Tc_11  = [ 1.103326e+02 ; -1.815336e+02 ; 5.296929e+02 ];
omc_error_11 = [ 1.123084e-02 ; 1.198963e-02 ; 1.906048e-03 ];
Tc_error_11  = [ 3.473393e+00 ; 4.884103e+00 ; 6.604953e+00 ];

%-- Image #12:
omc_12 = [ 3.032150e-02 ; -6.093105e-03 ; 1.273311e+00 ];
Tc_12  = [ 6.611474e+01 ; -2.647639e+02 ; 5.342924e+02 ];
omc_error_12 = [ 1.221037e-02 ; 1.151080e-02 ; 2.012505e-03 ];
Tc_error_12  = [ 3.591195e+00 ; 4.948272e+00 ; 7.002664e+00 ];

