% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly excecuted under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 516.211306686578040 ; 516.906737235545280 ];

%-- Principal point:
cc = [ 321.493330637187680 ; 242.197465297104430 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.223373882795900 ; -0.587757185205366 ; -0.012882982615943 ; 0.004143955778408 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 6.127979939278295 ; 6.223256157814749 ];

%-- Principal point uncertainty:
cc_error = [ 4.866654988844556 ; 3.784056553095406 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.028391857802565 ; 0.133772643657155 ; 0.003264939645517 ; 0.004696233345064 ; 0.000000000000000 ];

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
omc_1 = [ -1.359599e-01 ; 1.772443e-01 ; 1.520795e+00 ];
Tc_1  = [ 7.645495e+01 ; -1.515996e+02 ; 4.785406e+02 ];
omc_error_1 = [ 1.027426e-02 ; 1.108791e-02 ; 2.105115e-03 ];
Tc_error_1  = [ 4.587267e+00 ; 3.506119e+00 ; 5.935714e+00 ];

%-- Image #2:
omc_2 = [ 6.500254e-02 ; -5.757504e-02 ; 1.526256e+00 ];
Tc_2  = [ 6.483959e+01 ; -1.550954e+02 ; 4.494834e+02 ];
omc_error_2 = [ 1.274885e-02 ; 1.267626e-02 ; 1.362593e-03 ];
Tc_error_2  = [ 4.334864e+00 ; 3.317063e+00 ; 5.729418e+00 ];

%-- Image #3:
omc_3 = [ 1.075732e-01 ; -1.163934e-01 ; 1.537205e+00 ];
Tc_3  = [ 6.708927e+01 ; -1.178558e+02 ; 4.586617e+02 ];
omc_error_3 = [ 1.280044e-02 ; 1.301491e-02 ; 1.166721e-03 ];
Tc_error_3  = [ 4.382829e+00 ; 3.398755e+00 ; 5.721084e+00 ];

%-- Image #4:
omc_4 = [ 8.805510e-02 ; 3.014424e-01 ; 1.490447e+00 ];
Tc_4  = [ 5.997949e+01 ; -1.174292e+02 ; 4.381615e+02 ];
omc_error_4 = [ 9.311947e-03 ; 1.044613e-02 ; 1.773740e-03 ];
Tc_error_4  = [ 4.182882e+00 ; 3.202673e+00 ; 5.497186e+00 ];

%-- Image #5:
omc_5 = [ -3.802797e-01 ; -2.189878e-01 ; 1.617119e+00 ];
Tc_5  = [ 4.252326e+01 ; -1.054432e+02 ; 5.604503e+02 ];
omc_error_5 = [ 1.103688e-02 ; 1.165423e-02 ; 2.715422e-03 ];
Tc_error_5  = [ 5.290299e+00 ; 4.075265e+00 ; 6.275759e+00 ];

%-- Image #6:
omc_6 = [ -7.484522e-02 ; -2.720836e-01 ; 1.647807e+00 ];
Tc_6  = [ 4.261545e+01 ; -1.122172e+02 ; 4.984695e+02 ];
omc_error_6 = [ 1.335313e-02 ; 1.395457e-02 ; 1.755089e-03 ];
Tc_error_6  = [ 4.724304e+00 ; 3.651403e+00 ; 5.976415e+00 ];

%-- Image #7:
omc_7 = [ 2.935824e-01 ; -3.324226e-01 ; 1.547878e+00 ];
Tc_7  = [ 6.346147e+01 ; -1.244872e+02 ; 4.139320e+02 ];
omc_error_7 = [ 1.063630e-02 ; 1.106014e-02 ; 1.669178e-03 ];
Tc_error_7  = [ 3.980111e+00 ; 3.071084e+00 ; 5.279280e+00 ];

%-- Image #8:
omc_8 = [ -5.120254e-01 ; 3.579701e-01 ; 1.457444e+00 ];
Tc_8  = [ 4.333027e+01 ; -1.310929e+02 ; 5.011885e+02 ];
omc_error_8 = [ 8.790703e-03 ; 1.006783e-02 ; 3.776300e-03 ];
Tc_error_8  = [ 4.765185e+00 ; 3.660748e+00 ; 5.575753e+00 ];

%-- Image #9:
omc_9 = [ -2.610605e-01 ; 3.717156e-01 ; 1.827117e+00 ];
Tc_9  = [ 6.450372e+01 ; -8.316695e+01 ; 4.313615e+02 ];
omc_error_9 = [ 9.756552e-03 ; 1.041256e-02 ; 2.778028e-03 ];
Tc_error_9  = [ 4.084938e+00 ; 3.131946e+00 ; 5.067041e+00 ];

%-- Image #10:
omc_10 = [ -1.911393e-01 ; -1.102571e-01 ; 1.678810e+00 ];
Tc_10  = [ 5.316160e+01 ; -8.717568e+01 ; 4.944353e+02 ];
omc_error_10 = [ 1.237484e-02 ; 1.259023e-02 ; 1.863066e-03 ];
Tc_error_10  = [ 4.659645e+00 ; 3.588881e+00 ; 5.905604e+00 ];

%-- Image #11:
omc_11 = [ 1.191002e-01 ; -6.381249e-02 ; 1.541878e+00 ];
Tc_11  = [ 5.653319e+01 ; -1.205419e+02 ; 4.060950e+02 ];
omc_error_11 = [ 1.104056e-02 ; 1.144767e-02 ; 1.045018e-03 ];
Tc_error_11  = [ 3.897299e+00 ; 3.004483e+00 ; 5.087608e+00 ];

%-- Image #12:
omc_12 = [ -3.066345e-02 ; 2.849661e-01 ; 1.408246e+00 ];
Tc_12  = [ 2.043655e+01 ; -1.265810e+02 ; 4.523302e+02 ];
omc_error_12 = [ 9.413504e-03 ; 1.057757e-02 ; 2.020671e-03 ];
Tc_error_12  = [ 4.302135e+00 ; 3.294429e+00 ; 5.559556e+00 ];

