[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/x9tT2GbG)
# Jogo da Velha (tic-tac-toe) [VHDL, FPGA, DE0-CV, VGA]

## 1) Descrição
12689853 - Igor Teixeira Lacerda (Gerente)
12554863 - João Antônio Casarin Caldeira
12552902 - Miguel Luis Bessani Schwengber

Nome curto: Jogo_da_Velha
Endereço GIT: https://github.com/PCS-Poli-USP/projeto-final-grupo39

Personalize este README mudando o seguinte:  
- Mude o título "Projeto Final etc" para o nome do seu projeto.
- O nome curto deve ser uma ou duas palavras que identifiquem o seu projeto. Seu grupo no e-Disciplinas terá este nome.
- Preencha as seções abaixo.
- Substitua estas instruções por uma descrição breve do seu projeto.

## 2) Motivação
Não há como dissociar o nascimento dos vídeo-games do próprio desenvolvimento tecnológico da Eletrônica e da Ciência da Computação. Historicamente, nesse sentido, é interessante notar como certas ramificações da indústria do entretenimento surgiram comercialmente por meio de tecnologias intrinsecamente analógicas, como é o caso do cinema e da música. Contudo, os jogos eletrônicos, em contrapartida, se consagraram como um produto essencialmente digital e, talvez, sejam, de fato, o melhor exemplo do impacto cultural de uma revolução proporcionada pelos Sistemas Digitais em todo mundo. Se é verdade que o Mickey, que é um produto da tecnologia analógica do seu tempo, é um ícone mundial da cultura pop, é forçoso considerar que o Mario também o é. No entanto, ao contrário do personagem do Disney, o encanador italiano (ou japonês?) de Shigeru Miyamoto é o melhor representante dos “zeros e uns” que hoje lucram mais do que a indústria fonográfica e a do cinema somadas.

Sendo assim, considerando o imenso impacto da tecnologia digital na indústria do entretenimento, bem como a inclinação pessoal dos integrantes do grupo para essa vertente em particular dos joguinhos, rapidamente emergiu entre nós a ideia de implementar um jogo simples para fizesse uso dos conceitos vistos, primeiramente, nos cursos de Sistemas Digitais I e II e, agora, revisitados nesta disciplina.

## 3) Revisão
Inclua aqui uma rápida análise de projetos similares (comerciais ou não), concorrentes e qualquer outra informação prévia que pode ajudar você a guiar o seu projeto.
[1] https://www.youtube.com/watch?v=mhe5e2B9bL8
[2] DOMINGOS, Pedro. O Algoritmo Mestre. 1.ed. São Paulo: Novatec Editora, 2017.
[3] https://www2.pcs.usp.br/~labdig/material/DE0_CV_User_Manual.pdf
[4] https://www.youtube.com/watch?v=WK5FT5RD1sU&feature=youtu.be

## 4) Arquitetura
No mínimo deve ter um diagrama de blocos mostrando os elementos principais do projeto, todas as entradas e saídas planejadas.

## 5) Cronograma

26/05 - Escrita do relatório;
27/05 - Elaboração da estrutura do jogo em VHDL;
27/05 - Construção da primeira versão da engine;
30/05 - Primeiro teste na placa FPGA, tanto do jogo quanto da beta do SPAV; discussão presencial com os professores e entrega do relatório de apresentação;
02/06 - Ajustes e testes, a ideia é garantir o funcionamento perfeito do jogo até o final de semana;

Semana 10 (Atualizado, em 06/06)

04/06 - Foram feitas correções parciais na engine do jogo e adiantou-se a pesquisa e os trabalhos em VGA. Mudamos a condição de vitória do jogo;
06/06 - Conseguimos implementar satisfatoriamente a versão base da interface do jogo, em termos dos símbolos "X" e "O" e do grid do tabuleiro, bem como houve correções pequenas no funcionamento da engine;
07/06 - Pretenndemos concluir alguns dos problemas pendentes, como o reset global, reset da posição do jogo e um problema na máquina de estados. A prioridade, no entanto, é o funcionamento do SPAV;
09/06 - Testes e algumas possíveis modificações;

Semana 11

13/06 - Implementação do SPAV e realização dos seus primeiros testes;
14/06 - Refinamento da interface do jogo, implementação parcial do placar e, talvez, dos dos outros elementos gráficos;
16/06 - Entrega definitiva da engine do jogo, testes finais e aprimoramento final da interface;
19/06 - Verificação na véspera e correções de última hora (esperamos não haver nenhuma 😅);
20/06 - Apresentação final;
