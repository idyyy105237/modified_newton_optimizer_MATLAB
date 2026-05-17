
clear, clc, close all;


%BFGS é default
options=optimoptions('fminunc','Display','iter','SpecifyObjectiveGradient',true); 

w0=[pontoInicial];   % ponto inicial
%% aplicar o fminunc
[wopt,Fopt,exitflag,output]=fminunc(@FXwithgrad,w0,options)


