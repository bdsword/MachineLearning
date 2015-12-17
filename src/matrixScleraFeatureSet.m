function featureSet = matrixScleraFeatureSet(I, imageChannel)
%input: test image I, number of image channels
%output: a feature set in matrix form for each image pixel in sclera stage
%feature set: x, y, uH, sigmaH, uCb, sigmaCb, uCr, sigmaCr

[height, width] = size(I);

featureSet = [];

I2 = I.^2;

if imageChannel == 1
    u0_I  = I;
   u0_I2 = I2;
   sigma0 = sqrt( u0_I2 - u0_I.^2 );
   
   u3_I  = colfilt(I, [7 7], 'sliding', @matrixAverageIntensity);
   u3_I = adjustImage(u3_I, 3);
   u3_I2 = colfilt(I2, [7 7], 'sliding', @matrixAverageIntensity);
   u3_I2 = adjustImage(u3_I2, 3);
   sigma3 = sqrt( u3_I2 - u3_I.^2 );
   
   u5_I  = colfilt(I, [11 11], 'sliding', @matrixAverageIntensity);
   u5_I = adjustImage(u5_I, 5);
   u5_I2 = colfilt(I2, [11 11], 'sliding', @matrixAverageIntensity);
   u5_I2 = adjustImage(u5_I2, 5);
   sigma5 = sqrt( u5_I2 - u5_I.^2 );
   
   u7_I  = colfilt(I, [15 15], 'sliding', @matrixAverageIntensity);
   u7_I = adjustImage(u7_I, 7);
   u7_I2 = colfilt(I2, [15 15], 'sliding', @matrixAverageIntensity);
   u7_I2 = adjustImage(u7_I2, 7);
   sigma7 = sqrt( u7_I2 - u7_I.^2 );
   
   u9_I  = colfilt(I, [19 19], 'sliding', @matrixAverageIntensity);
   u9_I = adjustImage(u9_I, 9);
   u9_I2 = colfilt(I2, [19 19], 'sliding', @matrixAverageIntensity);
   u9_I2 = adjustImage(u9_I2, 9);
   sigma9 = sqrt( u9_I2 - u9_I.^2 );
else
    disp('Not implements yet');
end
end
