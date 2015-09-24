% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly excecuted under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 510.489923128851050 ; 513.761053112156900 ];

%-- Principal point:
cc = [ 317.649005394410100 ; 305.524941204116600 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.164554717457237 ; -0.220201284630651 ; 0.033409820140258 ; 0.001639763277251 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 8.189162281459701 ; 8.570751786727893 ];

%-- Principal point uncertainty:
cc_error = [ 6.551345099847963 ; 7.357752657510811 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.044764666313971 ; 0.098273946412681 ; 0.007122032301544 ; 0.003440963601234 ; 0.000000000000000 ];

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
omc_1 = [ -6.209801e-02 ; -1.377603e-01 ; 1.567447e+00 ];
Tc_1  = [ 3.275945e+01 ; -1.783372e+02 ; 5.679769e+02 ];
omc_error_1 = [ 1.758428e-02 ; 1.838967e-02 ; 2.587378e-03 ];
Tc_error_1  = [ 7.432752e+00 ; 8.138114e+00 ; 8.945176e+00 ];

%-- Image #2:
omc_2 = [ -4.950199e-02 ; -1.375927e-01 ; 1.571716e+00 ];
Tc_2  = [ 3.361095e+01 ; -1.770911e+02 ; 5.658576e+02 ];
omc_error_2 = [ 1.772655e-02 ; 1.851615e-02 ; 2.521046e-03 ];
Tc_error_2  = [ 7.404039e+00 ; 8.115957e+00 ; 8.945824e+00 ];

%-- Image #3:
omc_3 = [ 6.017072e-01 ; 1.573610e-01 ; 1.620193e+00 ];
Tc_3  = [ -4.112061e+00 ; -1.457275e+02 ; 4.909827e+02 ];
omc_error_3 = [ 1.456668e-02 ; 1.560581e-02 ; 4.521227e-03 ];
Tc_error_3  = [ 6.467721e+00 ; 7.114327e+00 ; 8.253439e+00 ];

%-- Image #4:
omc_4 = [ 4.768239e-01 ; -4.132046e-01 ; 2.057484e+00 ];
Tc_4  = [ 3.488744e+01 ; -1.157498e+02 ; 5.300499e+02 ];
omc_error_4 = [ 1.655910e-02 ; 1.853589e-02 ; 3.209952e-03 ];
Tc_error_4  = [ 6.938952e+00 ; 7.607929e+00 ; 8.264974e+00 ];

%-- Image #5:
omc_5 = [ 1.018991e-01 ; -3.704645e-01 ; 1.438526e+00 ];
Tc_5  = [ 1.152800e+01 ; -1.884971e+02 ; 5.487287e+02 ];
omc_error_5 = [ 1.868060e-02 ; 1.998553e-02 ; 2.550827e-03 ];
Tc_error_5  = [ 7.247226e+00 ; 7.937317e+00 ; 8.581061e+00 ];

%-- Image #6:
omc_6 = [ -2.098302e-01 ; 5.053050e-02 ; 2.115798e+00 ];
Tc_6  = [ 3.803731e+01 ; -1.442973e+02 ; 6.042326e+02 ];
omc_error_6 = [ 1.713621e-02 ; 1.865213e-02 ; 3.533666e-03 ];
Tc_error_6  = [ 7.900124e+00 ; 8.607167e+00 ; 9.194087e+00 ];

%-- Image #7:
omc_7 = [ 1.482079e-01 ; -1.549557e-01 ; 1.654972e+00 ];
Tc_7  = [ 5.010858e+01 ; -2.017734e+02 ; 5.562975e+02 ];
omc_error_7 = [ 1.899103e-02 ; 2.037864e-02 ; 2.166018e-03 ];
Tc_error_7  = [ 7.365641e+00 ; 8.069163e+00 ; 9.096676e+00 ];

%-- Image #8:
omc_8 = [ 8.951152e-01 ; -1.066649e-01 ; 1.671486e+00 ];
Tc_8  = [ -6.591381e+00 ; -1.295277e+02 ; 4.984503e+02 ];
omc_error_8 = [ 1.471835e-02 ; 1.557911e-02 ; 5.648600e-03 ];
Tc_error_8  = [ 6.565815e+00 ; 7.233567e+00 ; 8.605237e+00 ];

%-- Image #9:
omc_9 = [ -2.419636e-01 ; 2.387109e-02 ; 2.123277e+00 ];
Tc_9  = [ 6.011614e+01 ; -1.506152e+02 ; 6.268979e+02 ];
omc_error_9 = [ 1.697687e-02 ; 1.868015e-02 ; 3.655471e-03 ];
Tc_error_9  = [ 8.174321e+00 ; 8.946521e+00 ; 9.579567e+00 ];

%-- Image #10:
omc_10 = [ -6.484378e-02 ; -1.279865e-01 ; 1.140325e+00 ];
Tc_10  = [ -1.869868e+01 ; -2.420024e+02 ; 6.053988e+02 ];
omc_error_10 = [ 1.694216e-02 ; 1.826232e-02 ; 2.894460e-03 ];
Tc_error_10  = [ 8.034944e+00 ; 8.695612e+00 ; 9.506296e+00 ];

%-- Image #11:
omc_11 = [ -4.418169e-01 ; -5.053464e-02 ; 1.573289e+00 ];
Tc_11  = [ 6.205287e+00 ; -2.204988e+02 ; 6.711809e+02 ];
omc_error_11 = [ 1.483374e-02 ; 1.625270e-02 ; 4.928263e-03 ];
Tc_error_11  = [ 8.869579e+00 ; 9.520453e+00 ; 9.551875e+00 ];

%-- Image #12:
omc_12 = [ 6.474414e-01 ; 5.551545e-01 ; 1.752205e+00 ];
Tc_12  = [ -1.841855e+01 ; -1.664374e+02 ; 5.376683e+02 ];
omc_error_12 = [ 1.416449e-02 ; 1.535086e-02 ; 6.724568e-03 ];
Tc_error_12  = [ 7.114199e+00 ; 7.818868e+00 ; 9.218633e+00 ];

