clc
clear all
close all

[voice , Fs ] = audioread('test.wav');
hz = linspace(0,1000,(Fs / 2) );

Y0=fft(voice); 
psd0 = abs(Y0).^2/length(Y0);
plot(hz,psd0(1:length(hz)));
figure

voice_noised= awgn(voice,10,'measured');
Y_noised=fft(voice_noised);
psd_noised = abs(Y_noised).^2/length(Y_noised);
plot(hz,psd_noised(1:length(hz)));
figure
audiowrite('C:\Users\User\Desktop\1111\noised.wav', voice_noised,Fs);

[m,n]=size(voice_noised);
dt=1/Fs;
t=dt*(0:m-1);

idx = t<0.025 ;
voice_first_sequence = voice_noised(idx) ;
Y1=fft(voice_first_sequence); 
psd1 = abs(Y1).^2/length(Y1);
%plot(hz,psd1(1:length(hz)));
%figure

idx = t>t(end)-0.025 ;
voice_end_sequence = voice_noised(idx) ;
Y2=fft(voice_end_sequence); 
psd2 = abs(Y2).^2/length(Y2)
%plot(hz,psd2(1:length(hz)));
%figure

% plot(hz,Y2(1:length(hz)));
% figure


Y_mean = 0.5.*(Y1+Y2);
psd_mean = abs(Y_mean).^2/length(Y_mean);
%plot(hz,psd_mean(1:length(hz)));
%figure
%Y_mean2 = upsample(Y_mean);

%Y_mean_length
Yml = length(Y_mean)

iteration_size = length(Y_noised)/Yml
iteration_size = int16(fix(iteration_size))


for i = 1 : iteration_size
	Y_subtract((i-1)*Yml + 1: i*Yml) = Y_noised((i-1)*Yml + 1: i*Yml)-Y_mean;
end


psd_subtract = abs(Y_subtract).^2/length(Y_subtract);
plot(hz,psd_subtract(1:length(hz)));
inverse_Y = ifft(Y_subtract);
audiowrite('C:\Users\User\Desktop\1111\filtered.wav',inverse_Y,Fs);

