clear, clc, close all;

%% Paths para os problemas e para a função MN_modificado1.m
path(path,'../Problemas/GradHess') % f com o grad e hess
path(path,'../Problemas/F')  % f
path(path, '../');  % MN_modificado 1

%% Ponto inicial: (-1.2,1)
w0 = [-1.2; 1];

%% Para critério de paragem
epsilon = 1e-6;  
Kmax = 1000;  

%% Aplicar o algoritmo Método de Newton Modificado
[w_opt, Fval_opt, output] = MN_modificado1(@F1, @F1_with_grad_hess, w0, epsilon, Kmax)


%% Gráfico das curvas de nível
% Criar grelha
w1 = linspace(-1.5, 1.5, 200);
w2 = linspace(-0.5, 1.5, 200);
[W1, W2] = meshgrid(w1, w2);
% Fórmula vetorizada da função de Rosenbrock
F_vals = 100*(W2 - W1.^2).^2 + (1 - W1).^2;

% Contornos
figure
contour(W1, W2, F_vals, 20);
colorbar;
xlabel('w_1');
ylabel('w_2');
title('Método de Newton Modificado - Trajetória');
hold on

% Trajetória (colunas 2 e 3 do output: w1 e w2)
traj_w1 = output(:,2);
traj_w2 = output(:,3);
plot(traj_w1, traj_w2, 'ro-', 'LineWidth', 1, 'MarkerFaceColor', 'r', 'MarkerSize', 4)

% Ponto inicial e final
text(traj_w1(1), traj_w2(1)+0.1, 'w_0', 'FontSize', 10);
text(traj_w1(end), traj_w2(end)+0.1, 'w^*', 'FontSize', 10);
grid on
hold off