function [f] = F1(w)

syms w1 w2;

%----------------------
fun = 100*(w2-w1^2)^2+(1-w1)^2;
%----------------------

% --- Calcular função no ponto w ---
f=double(subs(fun,[w1 w2],[w(1) w(2)]));
% ----------------------------------

end