clear cam
cam = webcam(1);
preview(cam)

cd(fullfile('~','Documents','UQ', ...
    '2015 Sem 2','METR4202', 'Lab2', 'NegitivesBW'))
imCount = 350;
pause(1)

for i = imCount+1: imCount+50
    display(sprintf('Snapshot %d', i))
    I = snapshot(cam);
    I = skinDetect2FuncEdited(I);
    imwrite(I, sprintf('image_%d.jpg', i));
    pause(0.1);
end

clear cam
