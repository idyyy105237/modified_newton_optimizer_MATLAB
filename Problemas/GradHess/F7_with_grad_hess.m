function [f,gradf,hessf] = F7_with_grad_hess(w)

syms w1 w2 w3;

%----------------------
fun = w1^2+w2^2+w3^2;
grad = gradient(fun,[w1 w2 w3]);
hess = hessian(fun,[w1 w2 w3]);
%----------------------

% --- Calcular função, gradiente e hessiana no ponto w ---
f=double(subs(fun,[w1 w2 w3],[w(1) w(2) w(3)]));
gradf=double(subs(grad,[w1 w2 w3],[w(1) w(2) w(3)]));
hessf=double(subs(hess,[w1,w2 w3],[w(1),w(2) w(3)]));
% --------------------------------------------------------


end