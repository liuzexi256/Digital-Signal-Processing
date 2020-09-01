function v = fb_analysis(x,h)

    % INITIALIZE LENGTHS
    Q = length(x);      % Number of Samples
    M = size(h,2);      % Number of Filters
    N = size(h,1);      % Length of Filters
    
    % INTIALIZE OUTPUTS
    z = zeros(Q, M);
    v = zeros(ceil(Q/M), M);
    
    % APPLY ANALYSIS FILTERBANK HERE ===================
    % ADD CODE HERE
    for i = 1:M
        ztmp = conv(x,h(:,i));
        z(:,i) = ztmp(1:length(x));
        v(:,i) = downsample(z(:,i),M);
    end
    % ==================================================

end

