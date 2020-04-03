function p = maxFreq(x)
[y,Fs] = audioread(x);
%Fs=44100;
figure(3)
Y=fft(y); 
hz = linspace(0,1000,(Fs / 2) + 1);
psd = abs(Y).^2/length(Y);
plot(hz,psd(1:length(hz)));
[val, idx] = max(psd (1:length(hz)))
p = idx * 2/Fs *1000;

end