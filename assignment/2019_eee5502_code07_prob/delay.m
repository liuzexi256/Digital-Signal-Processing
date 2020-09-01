function y = delay(x,N)

    % LENGTH OF SIGNAL
    Q = length(x);

    % DEFINE DELAY FILTER
    h = zeros(N+1,1);
    h(N+1) = 1;
    
    % APPLY DELAY
    y = conv(x, h);
    y = y(1:Q);
    
end

