% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly excecuted under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 518.040610545876010 ; 518.834343207629560 ];

%-- Principal point:
cc = [ 314.937035201330330 ; 294.496688637004920 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.203920017360252 ; -0.320195264648592 ; 0.027734898956521 ; -0.001617363751408 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 7.186651451580915 ; 7.584145567776436 ];

%-- Principal point uncertainty:
cc_error = [ 4.498213836721073 ; 5.958494382512104 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.041149221988446 ; 0.155055004119462 ; 0.006376208801564 ; 0.003591293753103 ; 0.000000000000000 ];

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
omc_1 = [ -8.100409e-02 ; -4.817676e-02 ; 1.567063e+00 ];
Tc_1  = [ 7.796106e+01 ; -1.474056e+02 ; 5.082760e+02 ];
omc_error_1 = [ 1.447988e-02 ; 1.393831e-02 ; 1.865443e-03 ];
Tc_error_1  = [ 4.504841e+00 ; 5.824146e+00 ; 7.091173e+00 ];

%-- Image #2:
omc_2 = [ 1.289710e-01 ; 2.922116e-02 ; 1.606786e+00 ];
Tc_2  = [ 6.580544e+01 ; -1.423625e+02 ; 4.971355e+02 ];
omc_error_2 = [ 1.382869e-02 ; 1.516423e-02 ; 1.485960e-03 ];
Tc_error_2  = [ 4.415815e+00 ; 5.750133e+00 ; 7.251005e+00 ];

%-- Image #3:
omc_3 = [ 2.768429e-01 ; -3.845819e-01 ; 2.054894e+00 ];
Tc_3  = [ 8.508074e+01 ; -8.569309e+01 ; 5.099041e+02 ];
omc_error_3 = [ 1.296247e-02 ; 1.612039e-02 ; 2.346595e-03 ];
Tc_error_3  = [ 4.511690e+00 ; 5.864973e+00 ; 7.228898e+00 ];

%-- Image #4:
omc_4 = [ 4.612545e-01 ; -5.907033e-01 ; 1.272185e+00 ];
Tc_4  = [ 8.155820e+01 ; -1.550868e+02 ; 4.919192e+02 ];
omc_error_4 = [ 1.135211e-02 ; 1.089110e-02 ; 3.677003e-03 ];
Tc_error_4  = [ 4.397939e+00 ; 5.715452e+00 ; 7.258918e+00 ];

%-- Image #5:
omc_5 = [ -3.468736e-01 ; 3.004920e-01 ; 1.893065e+00 ];
Tc_5  = [ 7.010003e+01 ; -1.414680e+02 ; 5.337737e+02 ];
omc_error_5 = [ 1.230203e-02 ; 1.301042e-02 ; 3.657983e-03 ];
Tc_error_5  = [ 4.765261e+00 ; 6.063710e+00 ; 7.042915e+00 ];

%-- Image #6:
omc_6 = [ 2.320660e-01 ; -3.732477e-01 ; 1.416701e+00 ];
Tc_6  = [ 8.597426e+01 ; -1.465229e+02 ; 5.119399e+02 ];
omc_error_6 = [ 1.356663e-02 ; 1.264854e-02 ; 2.548987e-03 ];
Tc_error_6  = [ 4.554125e+00 ; 5.922112e+00 ; 7.250143e+00 ];

%-- Image #7:
omc_7 = [ 3.519381e-01 ; 3.409327e-01 ; 1.832123e+00 ];
Tc_7  = [ 7.781334e+01 ; -1.166595e+02 ; 4.952149e+02 ];
omc_error_7 = [ 1.160484e-02 ; 1.315496e-02 ; 3.047318e-03 ];
Tc_error_7  = [ 4.395281e+00 ; 5.730375e+00 ; 7.494813e+00 ];

%-- Image #8:
omc_8 = [ 1.652345e-01 ; -3.543463e-01 ; 1.876676e+00 ];
Tc_8  = [ 1.226940e+02 ; -1.363382e+02 ; 5.270467e+02 ];
omc_error_8 = [ 1.528799e-02 ; 1.632607e-02 ; 2.779727e-03 ];
Tc_error_8  = [ 4.686584e+00 ; 6.135922e+00 ; 7.401311e+00 ];

%-- Image #9:
omc_9 = [ -4.227485e-01 ; -3.171244e-01 ; 2.195595e+00 ];
Tc_9  = [ 1.119904e+02 ; -1.305251e+02 ; 5.773738e+02 ];
omc_error_9 = [ 1.363598e-02 ; 1.390785e-02 ; 3.813592e-03 ];
Tc_error_9  = [ 5.121490e+00 ; 6.593018e+00 ; 7.578649e+00 ];

%-- Image #10:
omc_10 = [ 5.763945e-01 ; -5.058708e-01 ; 1.437414e+00 ];
Tc_10  = [ 7.955902e+01 ; -1.076463e+02 ; 4.740117e+02 ];
omc_error_10 = [ 1.128223e-02 ; 1.149324e-02 ; 3.633859e-03 ];
Tc_error_10  = [ 4.204567e+00 ; 5.473090e+00 ; 7.043279e+00 ];

%-- Image #11:
omc_11 = [ -1.192095e-01 ; 8.653571e-02 ; 2.075926e+00 ];
Tc_11  = [ 7.091344e+01 ; -9.637421e+01 ; 5.114768e+02 ];
omc_error_11 = [ 1.511051e-02 ; 1.499003e-02 ; 2.257887e-03 ];
Tc_error_11  = [ 4.512722e+00 ; 5.827910e+00 ; 7.057015e+00 ];

%-- Image #12:
omc_12 = [ 4.011124e-01 ; -3.369872e-01 ; 1.613836e+00 ];
Tc_12  = [ 7.447347e+01 ; -1.160846e+02 ; 4.958011e+02 ];
omc_error_12 = [ 1.227809e-02 ; 1.326983e-02 ; 2.489916e-03 ];
Tc_error_12  = [ 4.416437e+00 ; 5.719403e+00 ; 7.183482e+00 ];

