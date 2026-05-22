clear, clc, close all;

%% Path para os problemas
path(path,'../Problemas/GradHess')

%% BFGS é default
options=optimoptions('fminunc','Display','iter','SpecifyObjectiveGradient',true); 

%% Ponto inicial : (1,-1)
w0=[1;-1];

%% Aplicar o fminunc: F8
[wopt,Fopt,exitflag,output]=fminunc(@F8_with_grad_hess,w0,options)