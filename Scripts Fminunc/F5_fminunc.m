clear, clc, close all;

%% Path para os problemas
path(path,'../Problemas/GradHess')

%% BFGS é default
options=optimoptions('fminunc','Display','iter','SpecifyObjectiveGradient',true); 

%% Ponto inicial : (0,0,0)
w0=[0;0;0];

%% Aplicar o fminunc: F5
[wopt,Fopt,exitflag,output]=fminunc(@F5_with_grad_hess,w0,options)