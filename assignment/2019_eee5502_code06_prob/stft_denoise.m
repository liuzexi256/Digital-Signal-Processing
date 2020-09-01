function [y, xSTFT, ySTFT] = stft_denoise(x, W)

    % DEFINE PARAMETER
    lambda = 0.99;

    % DETERMINE LENGTH INFORMATION
    N       = length(x);          % Number of samples
    M       = floor(N/W);         % Number of frames
    
    % INITIALIZE INTERMEDIATE AND OUTPUT SIGNALS
    y       = zeros(N,1);         % Initialize the output singnal
    xSTFT   = zeros(W,M);         % Initialize short-time Fourier transform
    ySTFT   = zeros(W,M);         % Initialize short-time Fourier transform
    mSTFT   = zeros(W,M);         % Initialize short-time Fourier transform
    
    % LOOP OVER SEGMENTS
    for m = 2:M
        z = x((W*(m-1)+1):(W*(m-1)+W));                % Get data segment
        xSTFT(:,m) = fft(z);                           % Fourier Transform 
        
        % ***** PERFORM PROCESSING HERE AND ASSIGN ySTFT *************
        mSTFT(:,m) = lambda*abs(mSTFT(:,m-1)) + (1-lambda)*abs(xSTFT(:,m));
        ySTFT(:,m) = xSTFT(:,m); 
        for k = 1:W
            if abs(ySTFT(k,m)) < mSTFT(k,m)*3, ySTFT(k,m) = 0;  end
        end
        % ************************************************************
        
        y((W*(m-1)+1):(W*(m-1)+W)) = real(ifft(ySTFT(:,m))); % Inverse Fourier Transform
    end

end


