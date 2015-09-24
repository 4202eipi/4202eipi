function colour_calibration(colourDevice)
cam = colourDevice;

preview(cam)

display('Press spacebar to capture image')
pause;

image = getsnapshot(cam);

imshow(image)

display('Please select Light Skin (#2)')
[y, x] = ginput(1);
lightSkinPixel = [int64(x), int64(y)];

display('Please select Neutral (#23)')
[y, x] = ginput(1);
neutralPixel = [int64(x), int64(y)];

HSV = rgb2hsv(image);
LAB = rgb2lab(image);

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
