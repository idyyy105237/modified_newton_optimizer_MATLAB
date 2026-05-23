clear, clc, close all;

%% Paths para os problemas e para a função MN_modificado1.m
path(path,'../Problemas/GradHess') % f com o grad e hess
path(path,'../Problemas/F')  % f
path(path, '../');  % MN_modificado 1

%% Ponto inicial: (2,2)
w0 = [2;2];

%% Para critério de paragem
epsilon = 1e-6;  
Kmax = 1000;  

%% Aplicar o algoritmo Método de Newton Modificado
[w_opt, Fval_opt, output] = MN_modificado1(@F2, @F2_with_grad_hess, w0, epsilon, Kmax)

%% Gráfico das curvas de nível (F2)
% Extrair trajetória
traj_w1 = output(:,2);
traj_w2 = output(:,3);
min_w1 = min(traj_w1); max_w1 = max(traj_w1);
min_w2 = min(traj_w2); max_w2 = max(traj_w2);
margem = 0.5;
w1_range = linspace(min_w1-margem, max_w1+margem, 200);
w2_range = linspace(min_w2-margem, max_w2+margem, 200);
[W1, W2] = meshgrid(w1_range, w2_range);
% Expressão vetorizada da função F2
F_vals = 4*W1.^2 + 2*W2.^2 + 4*W1.*W2 - 3*W1;

figure
contour(W1, W2, F_vals, 20);
colorbar;
xlabel('w_1'); ylabel('w_2');
title('Método de Newton Modificado - Trajetória (F2)');
hold on
plot(traj_w1, traj_w2, 'ro-', 'LineWidth', 1, 'MarkerFaceColor', 'r', 'MarkerSize', 4);
text(traj_w1(1), traj_w2(1)+0.1, 'w_0', 'FontSize', 10);
text(traj_w1(end), traj_w2(end)+0.1, 'w^*', 'FontSize', 10);
grid on
hold off