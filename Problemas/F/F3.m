function [f] = F3(w)

syms w1 w2;

%----------------------
fun = w1^2+2*w2^2-2*w1*w2-2*w2;
%----------------------

% --- Calcular função no ponto w ---
f=double(subs(fun,[w1 w2],[w(1) w(2)]));
% ----------------------------------

end