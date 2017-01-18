%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fachgebiet Audiokommunikation
% Einführung in die digitale Signalverarbeitung
% WS15/16
% Dozent: Prof. Weinzierl

% 3. Bewertetes Aufgabenblatt
% Autoren:          Matrikelnummern:
% Roman Gebhardt    371718
% Jonas Margraf     372625

% dft_imp.m

% DFT_IMP calulates the discrete fourier transformation of the input
% time series x and outputs its complex DFT coefficients as X.
% This function is only suitable for real signals.
function [X] = dft_imp(x)

    N = length(x);      
    halfN = floor(N/2)+1;
    X = zeros(1,halfN);

    % Compute only until symmetry axis
    for k=1:halfN
        for n = 1:N
            X(k) = X(k) + x(n)*exp((-1i*2*pi/N)*(k-1)*(n-1));
        end
    end

    % test if even or odd 
    if mod(N,2) == 0
        X_flip = fliplr(X(2:N/2));
        X_flip = conj(X_flip);
        X = [X X_flip];

    else
        X_flip = fliplr(X(2:floor(N/2)+1));
        X_flip = conj(X_flip);
        X = [X X_flip];

    end
end