function [f,gradf,hessf] = F1_with_grad_hess(w)

syms w1 w2;

%----------------------
fun = 100*(w2-w1^2)^2+(1-w1)^2;
grad = gradient(fun,[w1 w2]);
hess = hessian(fun,[w1 w2]);
%----------------------

% --- Calcular função, gradiente e hessiana no ponto w ---
f=double(subs(fun,[w1 w2],[w(1) w(2)]));
gradf=double(subs(grad,[w1 w2],[w(1) w(2)]));
hessf=double(subs(hess,[w1,w2],[w(1),w(2)]));
% --------------------------------------------------------


end