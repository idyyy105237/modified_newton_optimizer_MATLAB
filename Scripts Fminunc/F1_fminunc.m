clear, clc, close all;

%% Path para os problemas
path(path,'../Problemas/GradHess')

%% BFGS é default
options=optimoptions('fminunc','Display','iter','SpecifyObjectiveGradient',true,'OutputFcn',@outfun);

%% Ponto inicial : (-1.2,1)
w0=[-1.2;1];

%% Aplicar o fminunc: F1
[wopt,Fopt,exitflag,output]=fminunc(@F1_with_grad_hess,w0,options)

%% Gráfico das curvas de nível (fminunc)
% Recuperar trajetória gravada pela output function
traj = evalin('base', 'fminunc_history');
traj_w1 = traj(:,1);
traj_w2 = traj(:,2);

% Criar grelha
w1 = linspace(-1.5, 1.5, 200);
w2 = linspace(-0.5, 1.5, 200);
[W1, W2] = meshgrid(w1, w2);
F_vals = 100*(W2 - W1.^2).^2 + (1 - W1).^2;

% Contornos
figure
contour(W1, W2, F_vals, 20);
colorbar;
xlabel('w_1');
ylabel('w_2');
title('fminunc (BFGS) - Trajetória');
hold on
plot(traj_w1, traj_w2, 'bo-', 'LineWidth', 1, 'MarkerFaceColor', 'b', 'MarkerSize', 4);
text(traj_w1(1), traj_w2(1)+0.1, 'w_0', 'FontSize', 10);
text(traj_w1(end), traj_w2(end)+0.1, 'w^*', 'FontSize', 10);
grid on
hold off

%% Função de saída
function stop = outfun(x, optimValues, state)
    persistent history
    stop = false;
    switch state
        case 'init'
            history = x';
        case 'iter'
            history = [history; x'];
        case 'done'
            assignin('base', 'fminunc_history', history);
    end
end