% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly excecuted under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 506.545757948394110 ; 507.384785985794910 ];

%-- Principal point:
cc = [ 324.019381148426990 ; 299.111782925874080 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.151362309333106 ; -0.193717256696647 ; 0.022483445114902 ; 0.005145375171636 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 16.109230845857439 ; 16.639148260296622 ];

%-- Principal point uncertainty:
cc_error = [ 5.595271093179820 ; 7.185703732862855 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.032761066960974 ; 0.075192015049787 ; 0.005560029595804 ; 0.003682780552015 ; 0.000000000000000 ];

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
omc_1 = [ -1.969104e-02 ; 7.485273e-02 ; 1.617229e+00 ];
Tc_1  = [ 9.277825e+01 ; -1.371095e+02 ; 4.155516e+02 ];
omc_error_1 = [ 1.534402e-02 ; 1.450625e-02 ; 2.204291e-03 ];
Tc_error_1  = [ 4.680669e+00 ; 5.830645e+00 ; 1.283461e+01 ];

%-- Image #2:
omc_2 = [ 2.423825e-01 ; -3.696887e-01 ; 1.263430e+00 ];
Tc_2  = [ 3.792598e+01 ; -1.724566e+02 ; 3.539709e+02 ];
omc_error_2 = [ 1.690884e-02 ; 1.312563e-02 ; 2.966968e-03 ];
Tc_error_2  = [ 4.138013e+00 ; 5.105627e+00 ; 1.117650e+01 ];

%-- Image #3:
omc_3 = [ 1.283459e-01 ; 5.458877e-02 ; 1.625483e+00 ];
Tc_3  = [ 7.060648e+01 ; -1.758717e+02 ; 3.896236e+02 ];
omc_error_3 = [ 1.581951e-02 ; 1.503306e-02 ; 2.379273e-03 ];
Tc_error_3  = [ 4.518592e+00 ; 5.546966e+00 ; 1.238704e+01 ];

%-- Image #4:
omc_4 = [ 6.718727e-02 ; 1.167514e-01 ; 1.609737e+00 ];
Tc_4  = [ 9.467762e+01 ; -1.357142e+02 ; 3.986982e+02 ];
omc_error_4 = [ 1.513665e-02 ; 1.448028e-02 ; 2.123364e-03 ];
Tc_error_4  = [ 4.540019e+00 ; 5.650533e+00 ; 1.246927e+01 ];

%-- Image #5:
omc_5 = [ 1.309584e-01 ; 6.088622e-02 ; 1.561859e+00 ];
Tc_5  = [ 5.823159e+01 ; -1.940703e+02 ; 3.834886e+02 ];
omc_error_5 = [ 1.595932e-02 ; 1.551746e-02 ; 2.600179e-03 ];
Tc_error_5  = [ 4.491729e+00 ; 5.449596e+00 ; 1.225221e+01 ];

%-- Image #6:
omc_6 = [ 9.022288e-02 ; -4.429727e-02 ; 1.744199e+00 ];
Tc_6  = [ 1.036483e+02 ; -1.005614e+02 ; 4.037086e+02 ];
omc_error_6 = [ 1.755756e-02 ; 1.607540e-02 ; 1.783480e-03 ];
Tc_error_6  = [ 4.556450e+00 ; 5.793678e+00 ; 1.274961e+01 ];

%-- Image #7:
omc_7 = [ 1.009324e-01 ; -2.009995e-02 ; 1.700514e+00 ];
Tc_7  = [ 9.203648e+01 ; -9.698366e+01 ; 3.939444e+02 ];
omc_error_7 = [ 1.666571e-02 ; 1.538505e-02 ; 1.689639e-03 ];
Tc_error_7  = [ 4.450743e+00 ; 5.653674e+00 ; 1.246892e+01 ];

%-- Image #8:
omc_8 = [ 1.712037e-01 ; 1.734425e-02 ; 1.396751e+00 ];
Tc_8  = [ 3.414470e+01 ; -1.668401e+02 ; 3.863558e+02 ];
omc_error_8 = [ 1.548711e-02 ; 1.453370e-02 ; 2.101510e-03 ];
Tc_error_8  = [ 4.447701e+00 ; 5.577677e+00 ; 1.250456e+01 ];

%-- Image #9:
omc_9 = [ 2.691152e-01 ; -1.855937e-01 ; 1.439517e+00 ];
Tc_9  = [ 4.521797e+01 ; -1.388034e+02 ; 3.704226e+02 ];
omc_error_9 = [ 1.744773e-02 ; 1.337157e-02 ; 2.289153e-03 ];
Tc_error_9  = [ 4.248051e+00 ; 5.383701e+00 ; 1.190177e+01 ];

%-- Image #10:
omc_10 = [ 7.362852e-02 ; 1.174766e-01 ; 1.707874e+00 ];
Tc_10  = [ 9.337939e+01 ; -9.283809e+01 ; 4.081654e+02 ];
omc_error_10 = [ 1.605023e-02 ; 1.537309e-02 ; 1.985073e-03 ];
Tc_error_10  = [ 4.606195e+00 ; 5.791745e+00 ; 1.271541e+01 ];

%-- Image #11:
omc_11 = [ 6.623309e-02 ; -7.255533e-02 ; 1.538618e+00 ];
Tc_11  = [ 7.420431e+01 ; -1.188083e+02 ; 4.169075e+02 ];
omc_error_11 = [ 1.758750e-02 ; 1.659005e-02 ; 1.835251e-03 ];
Tc_error_11  = [ 4.677976e+00 ; 5.979837e+00 ; 1.324926e+01 ];

%-- Image #12:
omc_12 = [ -1.040778e-01 ; 2.843607e-01 ; 1.686033e+00 ];
Tc_12  = [ 9.506943e+01 ; -9.877711e+01 ; 4.442247e+02 ];
omc_error_12 = [ 1.540290e-02 ; 1.377923e-02 ; 3.028028e-03 ];
Tc_error_12  = [ 4.952693e+00 ; 6.165366e+00 ; 1.321920e+01 ];

