clear
clc

imFile = strcat('ICE/', '1.bmp');
testImage = imread(imFile);
imFile = strcat('ICE/', 'ansSclera1.bmp');
scleraImage = imread(imFile);
imFile = strcat('ICE/', 'ansIris1.bmp');
irisImage = imread(imFile);

featureSet = scleraFeatureSet(testImage, 1);

f = ones(1,12);
for n = 1:480
    for m = 1:640
        tmp = featureSet{n,m}
        f = [f; tmp];
    end
end

f = f';
net = feedforwardnet(18);
scleraImage = reshape(scleraImage, 1, 307200);
for n = 1:500
    net = train(net, f, scleraImage, nnMATLAB);
end

a = net(f);
a = reshape(a, 480, 640);
imshow(a);




