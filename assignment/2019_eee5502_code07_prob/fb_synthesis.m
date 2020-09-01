function y = fb_synthesis(v,g)

    % INITIALIZE LENGTHS
    M = size(g,2);      % Number of Filters
    N = size(g,1);      % Length of Filters
    Q = size(v,1)*M;    % Number of Samples
    
    % INTIALIZE OUTPUTS
    r = zeros(Q, M);    
    w = zeros(Q, M);
    
    % APPLY SYNTHESIS FILTERBANK HERE ==================
    % ADD CODE HERE
    y = zeros(Q,1);
    for i = 1:M
        r(:,i) = upsample(v(:,i),M);
        wtmp = conv(r(:,i),g(:,i));
        w(:,i) = wtmp(1:length(r(:,i)));
        y = w(:,i) + y;
    end
    % ==================================================
    
end

