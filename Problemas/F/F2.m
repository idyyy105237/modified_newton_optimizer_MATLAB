function [f] = F2(w)

syms w1 w2;

%----------------------
fun = 4*w1^2+2*w2^2+4*w1*w2-3*w1;
%----------------------

% --- Calcular função no ponto w ---
f=double(subs(fun,[w1 w2],[w(1) w(2)]));
% ----------------------------------

end