% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly excecuted under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 513.651132103862890 ; 514.879368808787040 ];

%-- Principal point:
cc = [ 321.524459478583650 ; 281.844029210014130 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.198300593062640 ; -0.458726632858620 ; 0.016891502700446 ; 0.002682905371761 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 10.539120731402091 ; 10.678890984703257 ];

%-- Principal point uncertainty:
cc_error = [ 5.172308298850028 ; 7.097079709735474 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.039195767616385 ; 0.150699744577622 ; 0.005456106464624 ; 0.003651419494102 ; 0.000000000000000 ];

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
omc_1 = [ 5.085291e-02 ; -1.828615e-01 ; 1.584042e+00 ];
Tc_1  = [ 8.821772e+01 ; -1.326357e+02 ; 4.712789e+02 ];
omc_error_1 = [ 1.559431e-02 ; 1.449697e-02 ; 1.707434e-03 ];
Tc_error_1  = [ 4.812926e+00 ; 6.580315e+00 ; 9.682024e+00 ];

%-- Image #2:
omc_2 = [ 8.790064e-02 ; -5.187116e-02 ; 1.603288e+00 ];
Tc_2  = [ 7.239426e+01 ; -1.490115e+02 ; 4.770424e+02 ];
omc_error_2 = [ 1.505093e-02 ; 1.509541e-02 ; 1.524416e-03 ];
Tc_error_2  = [ 4.904772e+00 ; 6.667153e+00 ; 9.913324e+00 ];

%-- Image #3:
omc_3 = [ 1.933922e-01 ; -4.425718e-01 ; 1.408527e+00 ];
Tc_3  = [ 6.488192e+01 ; -1.419101e+02 ; 4.594413e+02 ];
omc_error_3 = [ 1.355393e-02 ; 1.423299e-02 ; 2.694483e-03 ];
Tc_error_3  = [ 4.716555e+00 ; 6.386195e+00 ; 9.192844e+00 ];

%-- Image #4:
omc_4 = [ 1.968321e-02 ; 1.123715e-02 ; 1.667722e+00 ];
Tc_4  = [ 7.495815e+01 ; -1.293842e+02 ; 4.863898e+02 ];
omc_error_4 = [ 1.434717e-02 ; 1.450073e-02 ; 1.553430e-03 ];
Tc_error_4  = [ 4.961819e+00 ; 6.724629e+00 ; 9.885927e+00 ];

%-- Image #5:
omc_5 = [ 5.291750e-01 ; -4.883225e-01 ; 1.952342e+00 ];
Tc_5  = [ 7.620659e+01 ; -8.670030e+01 ; 4.564071e+02 ];
omc_error_5 = [ 1.282190e-02 ; 1.508331e-02 ; 3.337873e-03 ];
Tc_error_5  = [ 4.669316e+00 ; 6.377036e+00 ; 9.818789e+00 ];

%-- Image #6:
omc_6 = [ 3.045724e-04 ; -8.659818e-02 ; 1.546217e+00 ];
Tc_6  = [ 6.185566e+01 ; -1.492526e+02 ; 5.032364e+02 ];
omc_error_6 = [ 1.574864e-02 ; 1.568670e-02 ; 1.781833e-03 ];
Tc_error_6  = [ 5.147543e+00 ; 6.980879e+00 ; 1.029382e+01 ];

%-- Image #7:
omc_7 = [ 2.721249e-02 ; -4.405202e-02 ; 8.486504e-01 ];
Tc_7  = [ -2.490711e+01 ; -2.085219e+02 ; 5.129313e+02 ];
omc_error_7 = [ 1.479662e-02 ; 1.526368e-02 ; 1.951058e-03 ];
Tc_error_7  = [ 5.329042e+00 ; 7.146032e+00 ; 1.046248e+01 ];

%-- Image #8:
omc_8 = [ 4.837480e-01 ; -5.428383e-01 ; 1.549305e+00 ];
Tc_8  = [ 4.705527e+01 ; -1.205337e+02 ; 4.641589e+02 ];
omc_error_8 = [ 1.303778e-02 ; 1.383791e-02 ; 3.499932e-03 ];
Tc_error_8  = [ 4.765126e+00 ; 6.470981e+00 ; 9.724022e+00 ];

%-- Image #9:
omc_9 = [ 4.286173e-01 ; -4.131785e-01 ; 1.648170e+00 ];
Tc_9  = [ 5.352179e+01 ; -8.062773e+01 ; 4.650437e+02 ];
omc_error_9 = [ 1.356141e-02 ; 1.433148e-02 ; 3.084879e-03 ];
Tc_error_9  = [ 4.729411e+00 ; 6.441592e+00 ; 9.781194e+00 ];

%-- Image #10:
omc_10 = [ 3.890383e-02 ; 3.840707e-02 ; 2.264220e+00 ];
Tc_10  = [ 4.335537e+01 ; -8.643728e+01 ; 5.360060e+02 ];
omc_error_10 = [ 1.772920e-02 ; 1.708847e-02 ; 2.020343e-03 ];
Tc_error_10  = [ 5.456985e+00 ; 7.385060e+00 ; 1.091550e+01 ];

%-- Image #11:
omc_11 = [ 1.938237e-01 ; -3.300729e-01 ; 1.303415e+00 ];
Tc_11  = [ 3.832473e+01 ; -1.577891e+02 ; 5.022808e+02 ];
omc_error_11 = [ 1.532707e-02 ; 1.570122e-02 ; 2.206133e-03 ];
Tc_error_11  = [ 5.170954e+00 ; 7.003528e+00 ; 1.013457e+01 ];

%-- Image #12:
omc_12 = [ -2.179360e-01 ; 1.469202e-01 ; 1.825801e+00 ];
Tc_12  = [ 6.325191e+01 ; -1.187465e+02 ; 5.478816e+02 ];
omc_error_12 = [ 1.363319e-02 ; 1.402987e-02 ; 2.741984e-03 ];
Tc_error_12  = [ 5.565922e+00 ; 7.439027e+00 ; 1.047080e+01 ];

