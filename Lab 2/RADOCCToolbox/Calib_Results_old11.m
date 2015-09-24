% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly excecuted under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 522.242238967050300 ; 522.513116893575220 ];

%-- Principal point:
cc = [ 316.360682536451690 ; 234.680781841427290 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.177555295225218 ; -0.644565635227628 ; -0.027200204314519 ; 0.002311560933606 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 9.015714680891025 ; 9.060251836079209 ];

%-- Principal point uncertainty:
cc_error = [ 8.562481523806158 ; 7.901654669838817 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.057834411574682 ; 0.300453884361162 ; 0.007969591363391 ; 0.007941999220313 ; 0.000000000000000 ];

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
omc_1 = [ -1.227331e-01 ; 6.689666e-02 ; 1.609060e+00 ];
Tc_1  = [ 1.004528e+02 ; -1.011572e+02 ; 4.869942e+02 ];
omc_error_1 = [ 1.869479e-02 ; 1.973746e-02 ; 2.486281e-03 ];
Tc_error_1  = [ 8.026380e+00 ; 7.335031e+00 ; 8.306240e+00 ];

%-- Image #2:
omc_2 = [ 5.659828e-01 ; 2.245314e-01 ; 1.541215e+00 ];
Tc_2  = [ 5.279404e+01 ; -1.194725e+02 ; 4.336497e+02 ];
omc_error_2 = [ 1.941741e-02 ; 1.879956e-02 ; 4.939353e-03 ];
Tc_error_2  = [ 7.155817e+00 ; 6.573140e+00 ; 8.307796e+00 ];

%-- Image #3:
omc_3 = [ -3.123384e-01 ; 2.084680e-01 ; 1.054971e+00 ];
Tc_3  = [ 3.817876e+01 ; -1.778731e+02 ; 5.771796e+02 ];
omc_error_3 = [ 1.608042e-02 ; 1.686224e-02 ; 4.094715e-03 ];
Tc_error_3  = [ 9.526886e+00 ; 8.635765e+00 ; 9.274350e+00 ];

%-- Image #4:
omc_4 = [ 1.149009e-01 ; 2.816839e-01 ; 1.440807e+00 ];
Tc_4  = [ 9.293981e+01 ; -1.983580e+02 ; 5.015364e+02 ];
omc_error_4 = [ 2.003320e-02 ; 2.089698e-02 ; 3.131342e-03 ];
Tc_error_4  = [ 8.473901e+00 ; 7.654188e+00 ; 9.141803e+00 ];

%-- Image #5:
omc_5 = [ 1.122683e+00 ; -4.155693e-01 ; 1.254064e+00 ];
Tc_5  = [ 4.602089e+01 ; -3.532096e+01 ; 4.232486e+02 ];
omc_error_5 = [ 1.751768e-02 ; 1.791917e-02 ; 1.046768e-02 ];
Tc_error_5  = [ 6.904041e+00 ; 6.406693e+00 ; 8.452008e+00 ];

%-- Image #6:
omc_6 = [ -4.215315e-01 ; 2.659568e-01 ; 1.464916e+00 ];
Tc_6  = [ 9.137134e+01 ; -1.777894e+02 ; 5.721729e+02 ];
omc_error_6 = [ 1.683945e-02 ; 1.851057e-02 ; 6.072835e-03 ];
Tc_error_6  = [ 9.531183e+00 ; 8.604330e+00 ; 9.057958e+00 ];

%-- Image #7:
omc_7 = [ 4.970940e-01 ; -2.683392e-01 ; 1.903733e+00 ];
Tc_7  = [ 1.054676e+02 ; -5.964522e+01 ; 4.712404e+02 ];
omc_error_7 = [ 2.255980e-02 ; 2.154060e-02 ; 4.970189e-03 ];
Tc_error_7  = [ 7.693876e+00 ; 7.133044e+00 ; 8.402259e+00 ];

%-- Image #8:
omc_8 = [ 4.502476e-02 ; -3.767099e-01 ; 1.682372e+00 ];
Tc_8  = [ 1.390951e+02 ; -1.209366e+02 ; 4.970528e+02 ];
omc_error_8 = [ 2.162373e-02 ; 2.128112e-02 ; 3.728212e-03 ];
Tc_error_8  = [ 8.246997e+00 ; 7.603629e+00 ; 8.413230e+00 ];

%-- Image #9:
omc_9 = [ -1.980105e-01 ; 1.766458e-01 ; 1.568644e+00 ];
Tc_9  = [ 9.751590e+01 ; -1.455630e+02 ; 5.441862e+02 ];
omc_error_9 = [ 1.811102e-02 ; 1.928081e-02 ; 3.837976e-03 ];
Tc_error_9  = [ 9.005290e+00 ; 8.185299e+00 ; 9.099292e+00 ];

%-- Image #10:
omc_10 = [ 1.036130e+00 ; -3.143990e-01 ; 1.578594e+00 ];
Tc_10  = [ 6.242458e+01 ; -1.566387e+01 ; 4.321069e+02 ];
omc_error_10 = [ 1.879234e-02 ; 1.814067e-02 ; 9.774531e-03 ];
Tc_error_10  = [ 7.031692e+00 ; 6.531027e+00 ; 8.462692e+00 ];

%-- Image #11:
omc_11 = [ -3.321890e-01 ; -5.462118e-02 ; 8.275644e-01 ];
Tc_11  = [ 2.364241e+01 ; -1.908942e+02 ; 5.907408e+02 ];
omc_error_11 = [ 1.616349e-02 ; 1.792025e-02 ; 4.361649e-03 ];
Tc_error_11  = [ 9.764991e+00 ; 8.881154e+00 ; 9.813030e+00 ];

%-- Image #12:
omc_12 = [ 3.349852e-01 ; -4.744453e-01 ; 2.276751e+00 ];
Tc_12  = [ 1.303595e+02 ; -3.657278e+01 ; 5.224958e+02 ];
omc_error_12 = [ 2.508129e-02 ; 2.417011e-02 ; 6.021328e-03 ];
Tc_error_12  = [ 8.532667e+00 ; 7.929246e+00 ; 9.129132e+00 ];

