clear, clc, close all;

%% Path para os problemas
path(path,'../Problemas/GradHess')

%% BFGS é default
options=optimoptions('fminunc','Display','iter','SpecifyObjectiveGradient',true); 

%% Ponto inicial : (2,2)
w0=[2;2];

%% Aplicar o fminunc: F2
[wopt,Fopt,exitflag,output]=fminunc(@F2_with_grad_hess,w0,options)