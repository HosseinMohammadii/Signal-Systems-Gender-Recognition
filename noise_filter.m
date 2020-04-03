clc
clear all
close all
[voice , Fs ] = audioread('test.wav');
Y=fft(voice); 
hz = linspace(0,1000,(Fs / 2) + 1);
psd = abs(Y).^2/length(Y);

plot(hz,psd(1:length(hz)));
figure

 % I use gussian filter for denoising sounds
 voice= awgn(voice,10,'measured');
 
 Y=fft(voice); 
hz = linspace(0,1000,(Fs / 2) + 1);
psd = abs(Y).^2/length(Y);

plot(hz,psd(1:length(hz)));
figure


 windowSize = 5; 
window1 = (1/windowSize)*ones(1,windowSize);
a = 1;
filtered_sound1 = filter(window1,a,voice); 

Y=fft(filtered_sound1); 
hz = linspace(0,1000,(Fs / 2) + 1);
psd = abs(Y).^2/length(Y);

plot(hz,psd(1:length(hz)));

figure


 window2 = gausswin(15);
 filtered_sound2 = filter(window2,a,voice);
Y=fft(filtered_sound2); 
hz = linspace(0,1000,(Fs / 2) + 1);
psd = abs(Y).^2/length(Y);

plot(hz,psd(1:length(hz)));


