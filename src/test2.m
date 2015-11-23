clear
clc

net = feedforwardnet(10);

input = [0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1;
                 0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1;
                 0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1;
                 0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1];
             
output = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15];
for t = 1:1000
    [net, tri] = train(net, input, output,nnMATLAB);
end
view(net);

t15 = net(input);

