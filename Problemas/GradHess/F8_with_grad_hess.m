function [f,gradf,hessf] = F8_with_grad_hess(w)

syms w1 w2;

a=1; %1;10;100

%----------------------
fun = (w1-1)^2+(w2-1)^2+a*(w1^2+w2^2-0.25)^2;
grad = gradient(fun,[w1 w2]);
hess = hessian(fun,[w1 w2]);
%----------------------

% --- Calcular função, gradiente e hessiana no ponto w ---
f=double(subs(fun,[w1 w2],[w(1) w(2)]));
gradf=double(subs(grad,[w1 w2],[w(1) w(2)]));
hessf=double(subs(hess,[w1,w2],[w(1),w(2)]));
% --------------------------------------------------------


end