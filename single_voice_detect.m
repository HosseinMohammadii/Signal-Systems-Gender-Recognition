clc
clear all 
close all
[y,Fs] = audioread('v0.mp3');
Y=fft(y); 
hz = linspace(0,1000,(Fs / 2) + 1);
psd = abs(Y).^2/length(Y);

plot(hz,psd(1:length(hz)));
[val, idx] = max(psd (1:length(hz)));
p = idx * 2/Fs *1000;


if abs(p - 212) > abs(p - 122)
    disp("Male")
else 
    disp("Female")
end

