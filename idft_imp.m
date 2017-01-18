%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fachgebiet Audiokommunikation
% Einführung in die digitale Signalverarbeitung
% WS15/16
% Dozent: Prof. Weinzierl

% 3. Bewertetes Aufgabenblatt
% Autoren:          Matrikelnummern:
% Roman Gebhardt    371718
% Jonas Margraf     372625

% idft_imp.m

function [x] = idft_imp(X)

    N = length(X);
    halfN = floor(N/2)+1;
    x = zeros(1,N);
    X_temp = zeros(1,N);
    
    % test if N is even
    if mod(N,2) == 0
        for n=1:N
            % Compute only until the symmetry axis
            for k = 1:halfN
                X_temp(k) = X(k)*exp((-1i*2*pi/N)*-(k-1)*(n-1));  
            end
            X_temp(halfN+1:N) = conj(X_temp(2:halfN-1));
            x(n) = sum(X_temp)/N;
        end
    else
        for n=1:N
            for k = 1:halfN
                X_temp(k) = X(k)*exp((-1i*2*pi/N)*-(k-1)*(n-1));  
            end
            X_temp(halfN+1:N) = conj(X_temp(2:halfN));
            x(n) = sum(X_temp)/N;
        end
    end
  % output signal is real
    x = real(x);
end