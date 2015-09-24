% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly excecuted under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 512.762380307566100 ; 515.442019549239030 ];

%-- Principal point:
cc = [ 321.230066452041510 ; 293.486982697397590 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.214827666884057 ; -0.402520234519612 ; 0.026447408162069 ; 0.001182742440124 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 6.892357528815604 ; 7.121338411807705 ];

%-- Principal point uncertainty:
cc_error = [ 3.554827924265103 ; 5.116910772102655 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.035560346015254 ; 0.122426549686850 ; 0.006032791382118 ; 0.002556348300856 ; 0.000000000000000 ];

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
omc_1 = [ -1.402936e-01 ; 5.380224e-02 ; 1.522871e+00 ];
Tc_1  = [ 8.300705e+01 ; -1.687408e+02 ; 5.116080e+02 ];
omc_error_1 = [ 1.155761e-02 ; 1.132684e-02 ; 1.950220e-03 ];
Tc_error_1  = [ 3.616208e+00 ; 5.064776e+00 ; 7.120501e+00 ];

%-- Image #2:
omc_2 = [ 1.514003e-01 ; -1.739203e-01 ; 1.286052e+00 ];
Tc_2  = [ 4.752528e+01 ; -1.801199e+02 ; 4.572291e+02 ];
omc_error_2 = [ 1.344464e-02 ; 1.374978e-02 ; 1.664127e-03 ];
Tc_error_2  = [ 3.280109e+00 ; 4.626949e+00 ; 6.532193e+00 ];

%-- Image #3:
omc_3 = [ -6.617594e-01 ; 3.453919e-01 ; 1.361657e+00 ];
Tc_3  = [ 6.919975e+01 ; -1.564609e+02 ; 5.603796e+02 ];
omc_error_3 = [ 9.602315e-03 ; 9.196896e-03 ; 3.685283e-03 ];
Tc_error_3  = [ 3.949710e+00 ; 5.518412e+00 ; 6.939957e+00 ];

%-- Image #4:
omc_4 = [ 2.294976e-01 ; -1.394477e-01 ; 1.115097e+00 ];
Tc_4  = [ 5.907568e+01 ; -2.113020e+02 ; 4.509122e+02 ];
omc_error_4 = [ 1.435287e-02 ; 1.336055e-02 ; 1.954483e-03 ];
Tc_error_4  = [ 3.292896e+00 ; 4.624334e+00 ; 6.579736e+00 ];

%-- Image #5:
omc_5 = [ -1.863167e-01 ; 1.652997e-01 ; 1.660625e+00 ];
Tc_5  = [ 1.210803e+02 ; -1.740924e+02 ; 5.261443e+02 ];
omc_error_5 = [ 1.134551e-02 ; 1.116181e-02 ; 2.286099e-03 ];
Tc_error_5  = [ 3.742012e+00 ; 5.247843e+00 ; 7.330699e+00 ];

%-- Image #6:
omc_6 = [ 4.264566e-01 ; -4.315672e-01 ; 1.415459e+00 ];
Tc_6  = [ 9.361648e+01 ; -1.536389e+02 ; 4.368179e+02 ];
omc_error_6 = [ 1.054966e-02 ; 1.041845e-02 ; 2.521956e-03 ];
Tc_error_6  = [ 3.136650e+00 ; 4.395311e+00 ; 6.560887e+00 ];

%-- Image #7:
omc_7 = [ 1.275998e-01 ; -1.381158e-01 ; 1.653839e+00 ];
Tc_7  = [ 1.322551e+02 ; -1.645495e+02 ; 4.850500e+02 ];
omc_error_7 = [ 1.565751e-02 ; 1.458584e-02 ; 2.002311e-03 ];
Tc_error_7  = [ 3.459817e+00 ; 4.927180e+00 ; 6.941002e+00 ];

%-- Image #8:
omc_8 = [ -6.367673e-02 ; 4.448207e-02 ; 1.499472e+00 ];
Tc_8  = [ 1.069452e+02 ; -1.510617e+02 ; 5.183475e+02 ];
omc_error_8 = [ 1.281905e-02 ; 1.227673e-02 ; 1.628369e-03 ];
Tc_error_8  = [ 3.637908e+00 ; 5.150433e+00 ; 7.268683e+00 ];

%-- Image #9:
omc_9 = [ -3.539334e-01 ; -2.824792e-01 ; 1.472597e+00 ];
Tc_9  = [ 1.259141e+02 ; -1.557717e+02 ; 5.166753e+02 ];
omc_error_9 = [ 1.086499e-02 ; 9.288761e-03 ; 3.017332e-03 ];
Tc_error_9  = [ 3.668790e+00 ; 5.163914e+00 ; 6.822680e+00 ];

%-- Image #10:
omc_10 = [ 9.843797e-02 ; 2.321766e-01 ; 1.417170e+00 ];
Tc_10  = [ 1.140430e+02 ; -1.484881e+02 ; 5.227970e+02 ];
omc_error_10 = [ 1.227569e-02 ; 1.299135e-02 ; 1.704624e-03 ];
Tc_error_10  = [ 3.668459e+00 ; 5.231608e+00 ; 7.438297e+00 ];

%-- Image #11:
omc_11 = [ -2.398860e-02 ; -2.790457e-01 ; 1.031341e+00 ];
Tc_11  = [ 6.671101e+01 ; -1.965786e+02 ; 4.726910e+02 ];
omc_error_11 = [ 1.151454e-02 ; 9.746238e-03 ; 2.054091e-03 ];
Tc_error_11  = [ 3.379765e+00 ; 4.731344e+00 ; 6.793150e+00 ];

%-- Image #12:
omc_12 = [ -4.067898e-01 ; -1.696581e-01 ; 1.684624e+00 ];
Tc_12  = [ 1.335648e+02 ; -1.446540e+02 ; 5.374419e+02 ];
omc_error_12 = [ 1.105103e-02 ; 9.994106e-03 ; 3.040637e-03 ];
Tc_error_12  = [ 3.811026e+00 ; 5.363196e+00 ; 7.053415e+00 ];

