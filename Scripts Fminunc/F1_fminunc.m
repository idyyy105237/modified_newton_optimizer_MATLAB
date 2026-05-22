clear, clc, close all;

%% Path para os problemas
path(path,'../Problemas/GradHess')

%% BFGS é default
options=optimoptions('fminunc','Display','iter','SpecifyObjectiveGradient',true); 

%% Ponto inicial : (-1.2,1)
w0=[-1.2;1];

%% Aplicar o fminunc: F1
[wopt,Fopt,exitflag,output]=fminunc(@F1_with_grad_hess,w0,options)