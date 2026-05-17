function [w_opt,Fval_opt,output]=MN_modificado1(F,FwithgradHess,w0,epsilon,Kmax)
%
k=0;  %contador de iterações
wk=w0;
output=[];
while (k <= Kmax)
    [Fk,gradk,hessk]=FwithgradHess(wk);
    norma=norm(gradk,inf);
    if (norma <= epsilon)
        output=[output; k wk' norma etak Fk];
        break;
    end
    %direção de Newton: resolver o sistema hessk*sk=-gradk
    % Modificação da Hessiana

    
    beta = 1e-3;
    n = length(wk);
    I = eye(n);

    min_diag = min(diag(hessk));
    if min_diag > 0
        tau = 0;
    else
        tau = -min_diag + beta;
    end
    
    while true
    
        Bk = hessk + tau*I;
    
        [~,p] = chol(Bk);
    
        % p==0 => definida positiva
        if p == 0
            break;
        end
    
        % aumentar tau
        tau = max(2*tau,beta);
    end
    
    % direção de Newton modificada
    sk = -Bk\gradk;
    %% calcular eta com procura de Armijo com backtracking: F(wk+eta*sk)<=...
    etak= ArmijoBacktracking(F,Fk,gradk,wk,sk);
   
    %% para guardar informação
    output=[output; k wk' norma etak Fk tau]
    %% novo ponto
    wk=wk+etak*sk;
    k=k+1;
end
w_opt=wk;
Fval_opt=Fk;
end
