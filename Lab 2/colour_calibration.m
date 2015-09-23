function colour_calibration(colourDevice)
cam = colourDevice;

display('Press spacebar to capture image')
waitforbuttonpress;

image = getsnapshot(cam);

imshow(image)

display('Please select Light Skin followed by Neutral')
[y,x] = ginput(2);

HSV = rgb2hsv(image);
LAB = rgb2lab(image);

lightSkinPixel = [int64(x(1)), int64(y(1))];
neutralPixel = [int64(x(2)), int64(y(2))];

lightSkinRGB = [image(lightSkinPixel(1), lightSkinPixel(2), 1);
                image(lightSkinPixel(1), lightSkinPixel(2), 2);
                image(lightSkinPixel(1), lightSkinPixel(2), 3)]

lightSkinHSV = [HSV(lightSkinPixel(1), lightSkinPixel(2), 1);
                HSV(lightSkinPixel(1), lightSkinPixel(2), 2);
                HSV(lightSkinPixel(1), lightSkinPixel(2), 3)]

lightSkinLAB = [LAB(lightSkinPixel(1), lightSkinPixel(2), 1);
                LAB(lightSkinPixel(1), lightSkinPixel(2), 2);
                LAB(lightSkinPixel(1), lightSkinPixel(2), 3)]

neutralRGB = [image(neutralPixel(1), neutralPixel(2), 1);
              image(neutralPixel(1), neutralPixel(2), 2);
              image(neutralPixel(1), neutralPixel(2), 3)]
          
neutralHSV = [HSV(neutralPixel(1), neutralPixel(2), 1);
              HSV(neutralPixel(1), neutralPixel(2), 2);
              HSV(neutralPixel(1), neutralPixel(2), 3)]
          
neutralLAB = [LAB(neutralPixel(1), neutralPixel(2), 1);
              LAB(neutralPixel(1), neutralPixel(2), 2);
              LAB(neutralPixel(1), neutralPixel(2), 3)]
end
