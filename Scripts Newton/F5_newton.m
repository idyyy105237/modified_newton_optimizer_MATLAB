clear, clc, close all;

%% Paths para os problemas e para a função MN_modificado1.m
path(path,'../Problemas/GradHess') % f com o grad e hess
path(path,'../Problemas/F')  % f
path(path, '../');  % MN_modificado 1

%% Ponto inicial: (0,0,0)
w0 = [0;0;0];

%% Para critério de paragem
epsilon = 1e-6;  
Kmax = 1000;  

%% Aplicar o algoritmo Método de Newton Modificado
[w_opt, Fval_opt, output] = MN_modificado1(@F5, @F5_with_grad_hess, w0, epsilon, Kmax)

