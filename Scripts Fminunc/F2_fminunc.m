clear, clc, close all;

%% Path para os problemas
path(path,'../Problemas/GradHess')

%% BFGS é default
options=optimoptions('fminunc','Display','iter','SpecifyObjectiveGradient',true,'OutputFcn',@outfun);

%% Ponto inicial : (2,2)
w0=[2;2];

%% Aplicar o fminunc: F2
[wopt,Fopt,exitflag,output]=fminunc(@F2_with_grad_hess,w0,options)

%% Trajetória e curvas de nível
function stop = outfun(x, optimValues, state)
    persistent hist
    stop = false;
    switch state
        case 'init'
            hist = x';
        case 'iter'
            hist = [hist; x'];
        case 'done'
            assignin('base', 'traj_fminunc', hist);
    end
end

traj = evalin('base', 'traj_fminunc');
traj_w1 = traj(:,1);
traj_w2 = traj(:,2);

min_w1 = min(traj_w1); max_w1 = max(traj_w1);
min_w2 = min(traj_w2); max_w2 = max(traj_w2);
margem = 0.5;
w1 = linspace(min_w1-margem, max_w1+margem, 200);
w2 = linspace(min_w2-margem, max_w2+margem, 200);
[W1, W2] = meshgrid(w1, w2);

F_vals = 4*W1.^2 + 2*W2.^2 + 4*W1.*W2 - 3*W1;

figure
contour(W1, W2, F_vals, 20);
colorbar; xlabel('w_1'); ylabel('w_2');
title('fminunc (BFGS) - Trajetória');
hold on
plot(traj_w1, traj_w2, 'bo-', 'LineWidth', 1, 'MarkerFaceColor', 'b', 'MarkerSize', 4);
text(traj_w1(1), traj_w2(1)+0.1, 'w_0');
text(traj_w1(end), traj_w2(end)+0.1, 'w^*');
grid on; hold off