# Método de Newton Modificado para Otimização Não Linear

## Descrição

Este repositório contém a implementação do **Método de Newton Modificado** para resolução de problemas de otimização não linear sem restrições, desenvolvida em MATLAB no âmbito da unidade curricular de **Otimização** da Licenciatura em Ciências da Computação da Universidade do Minho.

O algoritmo implementa uma versão robusta do método de Newton, recorrendo à regularização da matriz Hessiana para garantir direções de descida válidas e à pesquisa linear de Armijo (*Armijo Backtracking*) para determinar o comprimento do passo em cada iteração.

O desempenho do método é comparado com o algoritmo **BFGS**, utilizando a função `fminunc` do MATLAB, através de um conjunto de problemas de teste.

## Funcionalidades

- Implementação do Método de Newton Modificado;
- Regularização da matriz Hessiana através da adição de um múltiplo da matriz identidade;
- Verificação de positividade com fatorização de Cholesky;
- Implementação da pesquisa linear de Armijo (*Backtracking*);
- Comparação experimental com o método Quasi-Newton (BFGS);
- Testes em vários problemas de otimização não linear.


## Tecnologias

- MATLAB

## A minha contribuição

Este foi um **projeto académico desenvolvido em grupo**.

As minhas principais contribuições foram:

- Desenvolvimento da lógica do **Método de Newton Modificado**;
- Implementação da regularização da matriz Hessiana;
- Implementação da pesquisa linear de **Armijo Backtracking**;
- Desenvolvimento da implementação utilizando o método **BFGS** (`fminunc`);
- Estrutura principal do algoritmo e integração dos diferentes componentes.

Os restantes elementos da equipa contribuíram para a implementação das funções de teste, organização do projeto e restante infraestrutura.


## Resultados

O Método de Newton Modificado convergiu com sucesso para as soluções esperadas na maioria dos problemas testados, apresentando menor número de iterações do que o método BFGS em vários casos, especialmente em funções quadráticas, onde beneficia da utilização da Hessiana exata.

## Contexto Académico

Projeto desenvolvido na Unidade Curricular de **Otimização**  
Licenciatura em Ciências da Computação  
**Universidade do Minho**
