% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly excecuted under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 505.380650565786140 ; 506.106105581046560 ];

%-- Principal point:
cc = [ 311.672681110314040 ; 286.432435331214610 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.221691738454753 ; -0.435805275916527 ; 0.023356978964770 ; -0.002643223544427 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 8.137029410086516 ; 8.353990164601820 ];

%-- Principal point uncertainty:
cc_error = [ 5.497534592240243 ; 6.263640990941596 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.046073857945546 ; 0.189132502161153 ; 0.006306724100805 ; 0.004131625308282 ; 0.000000000000000 ];

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
omc_1 = [ -9.740627e-02 ; -5.844020e-02 ; 1.587134e+00 ];
Tc_1  = [ 7.044577e+01 ; -1.134583e+02 ; 5.111190e+02 ];
omc_error_1 = [ 1.604330e-02 ; 1.545505e-02 ; 1.822409e-03 ];
Tc_error_1  = [ 5.570839e+00 ; 6.302120e+00 ; 8.226571e+00 ];

%-- Image #2:
omc_2 = [ 3.433168e-01 ; -1.593726e-01 ; 1.710482e+00 ];
Tc_2  = [ 7.459515e+01 ; -1.021298e+02 ; 4.726680e+02 ];
omc_error_2 = [ 1.345275e-02 ; 1.442989e-02 ; 2.142927e-03 ];
Tc_error_2  = [ 5.264493e+00 ; 5.912009e+00 ; 7.920729e+00 ];

%-- Image #3:
omc_3 = [ -5.128950e-01 ; 8.584552e-03 ; 1.397576e+00 ];
Tc_3  = [ 3.965496e+01 ; -1.447118e+02 ; 5.834484e+02 ];
omc_error_3 = [ 1.342946e-02 ; 1.336446e-02 ; 3.977261e-03 ];
Tc_error_3  = [ 6.433311e+00 ; 7.154240e+00 ; 8.354440e+00 ];

%-- Image #4:
omc_4 = [ 8.325121e-02 ; -5.560233e-02 ; 1.588910e+00 ];
Tc_4  = [ 3.289887e+01 ; -1.571947e+02 ; 5.214322e+02 ];
omc_error_4 = [ 1.662258e-02 ; 1.808559e-02 ; 1.809350e-03 ];
Tc_error_4  = [ 5.789045e+00 ; 6.479928e+00 ; 8.645692e+00 ];

%-- Image #5:
omc_5 = [ -1.514274e-02 ; 2.106888e-01 ; 2.174768e+00 ];
Tc_5  = [ 8.021301e+01 ; -1.091722e+02 ; 5.538519e+02 ];
omc_error_5 = [ 1.600197e-02 ; 1.682624e-02 ; 2.661848e-03 ];
Tc_error_5  = [ 6.101301e+00 ; 6.858740e+00 ; 9.166453e+00 ];

%-- Image #6:
omc_6 = [ 2.602791e-01 ; -1.293131e-02 ; 1.329384e+00 ];
Tc_6  = [ 2.306686e+01 ; -1.806849e+02 ; 5.115915e+02 ];
omc_error_6 = [ 1.465573e-02 ; 1.519442e-02 ; 1.917501e-03 ];
Tc_error_6  = [ 5.738592e+00 ; 6.409549e+00 ; 8.584504e+00 ];

%-- Image #7:
omc_7 = [ 1.934755e-01 ; -1.984776e-01 ; 2.097908e+00 ];
Tc_7  = [ 7.376576e+01 ; -9.045704e+01 ; 5.238373e+02 ];
omc_error_7 = [ 1.716997e-02 ; 1.854015e-02 ; 1.730754e-03 ];
Tc_error_7  = [ 5.789413e+00 ; 6.516077e+00 ; 8.638862e+00 ];

%-- Image #8:
omc_8 = [ 3.408698e-01 ; -3.045963e-01 ; 1.488584e+00 ];
Tc_8  = [ 3.791149e+01 ; -1.125222e+02 ; 5.005262e+02 ];
omc_error_8 = [ 1.409680e-02 ; 1.398934e-02 ; 2.497304e-03 ];
Tc_error_8  = [ 5.534793e+00 ; 6.237676e+00 ; 8.309500e+00 ];

%-- Image #9:
omc_9 = [ 1.196659e-01 ; -1.565797e-01 ; 1.391675e+00 ];
Tc_9  = [ 1.880560e+01 ; -1.614428e+02 ; 5.316340e+02 ];
omc_error_9 = [ 1.783488e-02 ; 1.875738e-02 ; 1.800648e-03 ];
Tc_error_9  = [ 5.893360e+00 ; 6.673900e+00 ; 8.786743e+00 ];

%-- Image #10:
omc_10 = [ 8.954543e-01 ; -8.262323e-01 ; 1.953362e+00 ];
Tc_10  = [ 3.495162e+01 ; -1.208836e+01 ; 5.016012e+02 ];
omc_error_10 = [ 1.247524e-02 ; 1.425800e-02 ; 6.785720e-03 ];
Tc_error_10  = [ 5.484312e+00 ; 6.191345e+00 ; 8.338063e+00 ];

%-- Image #11:
omc_11 = [ 1.880654e-01 ; 4.371324e-02 ; 1.658892e+00 ];
Tc_11  = [ 5.398593e+01 ; -1.091124e+02 ; 5.266149e+02 ];
omc_error_11 = [ 1.470716e-02 ; 1.589216e-02 ; 1.871480e-03 ];
Tc_error_11  = [ 5.814610e+00 ; 6.544261e+00 ; 8.693616e+00 ];

%-- Image #12:
omc_12 = [ 1.006873e-01 ; -3.421913e-01 ; 1.190935e+00 ];
Tc_12  = [ 9.766340e-01 ; -1.654945e+02 ; 5.307734e+02 ];
omc_error_12 = [ 1.633879e-02 ; 1.656939e-02 ; 2.173788e-03 ];
Tc_error_12  = [ 5.921032e+00 ; 6.645688e+00 ; 8.547912e+00 ];

