function [y, xSTFT, ySTFT] = stft_denoise1(x, W)
    n = 0 : 1 : 10000;
    wn_temp = 1/2*[1- cos(2*pi*n/(W-1))];
    wn = wn_temp(1:W);
    wn = wn';
    wn1 = hann(W);
    %wn1 = wn1';
    % DEFINE PARAMETER
    lambda = 0.99;
    % DETERMINE LENGTH INFORMATION
    N       = length(x);          % Number of samples
    M       = floor(N/W);         % Number of frames
    
    % INITIALIZE INTERMEDIATE AND OUTPUT SIGNALS
    y       = zeros(N,1);         % Initialize the output singnal
    xSTFT   = zeros(W,2*M);         % Initialize short-time Fourier transform
    ySTFT   = zeros(W,2*M);         % Initialize short-time Fourier transform
    mSTFT   = zeros(W,2*M);         % Initialize short-time Fourier transform
    
    % LOOP OVER SEGMENTS
    for m = 2:2*M
        %ÐÞ¸Ä²¿·Ö
        z = x((W/2*(m-1)+1):(W/2*(m-1)+W));                % Get data segment
        xSTFT(:,m) = fft(z);                           % Fourier Transform 
        
        % ***** PERFORM PROCESSING HERE AND ASSIGN ySTFT *************
        mSTFT(:,m) = lambda*abs(mSTFT(:,m-1)) + (1-lambda)*abs(xSTFT(:,m));
        ySTFT(:,m) = xSTFT(:,m); 
        for k = 1:W
            if abs(ySTFT(k,m)) < mSTFT(k,m)*3, ySTFT(k,m) = 0;  end
        end
        
    end
        % ************************************************************
    for m = 2 : M    
        y((W*(m-1)+1):(W*(m-1)+W)) = real(ifft(ySTFT(:,m*2-1)).*wn1);
        y((W*(m-1)+1):(W*(m-1)+W/2)) = y((W*(m-1)+1):(W*(m-1)+W/2)) + real(ifft(ySTFT((1+W/2):W,m*2-2)).*wn1(1001:2000));% Inverse Fourier Transform
 
end


