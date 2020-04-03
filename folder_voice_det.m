function voice_det(folder)
%d = uigetdir(pwd, 'Select a folder');
files = dir(fullfile(folder, '*.mp3'));
ans = zeros(1,size(files,1));
for i = 1:size(files,1)
    
    [y,Fs] = audioread(fullfile(folder, files(i).name));
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


end

end
