function [y, xSTFT, ySTFT] = overlap_addSTFT(x, W)

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
    for m = 2:2*M
        z = x((0.5*W*(m-1)+1):(0.5*W*(m-1)+W));                % Get data segment
        xSTFT(:,m) = fft(z);                           % Fourier Transform 
        
        % ***** PERFORM PROCESSING HERE AND ASSIGN ySTFT *************
        mSTFT(:,m) = lambda*abs(mSTFT(:,m-1)) + (1-lambda)*abs(xSTFT(:,m));
        ySTFT(:,m) = xSTFT(:,m); 
        for k = 1:W
            if abs(ySTFT(k,m)) < mSTFT(k,m)*3, ySTFT(k,m) = 0;  end
        end
        % ************************************************************
        h = hann(W);
        y((0.5*W*(m-1)+1):(0.5*W*(m-1)+W)) = y((0.5*W*(m-1)+1):(0.5*W*(m-1)+W)) + h.*real(ifft(ySTFT(:,m))); % Inverse Fourier Transform
        
    end

end


