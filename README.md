# Blackjack

**Disciplina**: FGA0210 - PARADIGMAS DE PROGRAMAÇÃO - T01 <br>
**Nro do Grupo**: 01<br>
**Paradigma**: Funcional<br>

## Alunos
|Matrícula | Aluno |
| -- | -- |
| 18/0012002 |  Álvaro Gouveia |
| 19/0044799 |  Antônio Ferreira de Castro Neto |
| 19/0042419 |  Davi Matheus da Rocha de Oliveira |
| 17/0142329 |  Francisco Emanoel Ferreira |
| 19/0014032 |  Guilherme Rogelin Vial |
| 18/0022237 |  Liverson Furtado Severo |
| 14/0155350 |  Matheus Filipe Faria Alves de Andrade |
| 19/0058650 |  Natanael Fernandes Coelho Filho |

## Sobre 
Esse repositório possui como objetivo a realização do trabalho sobre o paradigma funcional na matéria Paradigmas de Programação do curso de engenharia de software na UnB - FGA. 

Nosso projeto terá como base [esse](https://github.com/UnBParadigmas2021-2/2021.2_G5_Funcional_Blackjack) projeto, um jogo de blackjack em que o usuário joga contra a máquina. 

Em que no Blackjack ou 21 é um jogo de cartas jogado num casino com 1 a 8 baralhos de 52 cartas cada, com o objetivo de ter mais pontos que o seu adversário, mas não ultrapassando os 21 (caso em que perde). até 5 cartas, ou até chegar ao número 17.

Nosso objetivo principal será a implementação de um modo multijogador para o jogo, além de melhorias gerais.

## Screenshots
```
menu "interativo da aplicação
```
<a href="https://ibb.co/RC1Py1T"><img src="https://i.ibb.co/fCbtvbd/Captura-de-tela-de-2022-11-24-23-30-10.png" alt="Captura-de-tela-de-2022-11-24-23-30-10" border="0"></a>

```
iniciando Partida
```
<a href="https://ibb.co/714SCrx"><img src="https://i.ibb.co/YLZNQf4/Captura-de-tela-de-2022-11-24-23-35-36.png" alt="Captura-de-tela-de-2022-11-24-23-35-36" border="0"></a><br /><a target='_blank' href='https://pt-br.imgbb.com/'>site de criar fotos</a><br />


```
Finalizando Partida
```
<a href="https://ibb.co/SwMVw2H"><img src="https://i.ibb.co/ZzFcz3v/Captura-de-tela-de-2022-11-24-23-37-36.png" alt="Captura-de-tela-de-2022-11-24-23-37-36" border="0"></a>

## Instalação 
**Linguagens**: Haskell<br>
**Tecnologias**: GHCI<br>

- Instalar o GHC
```bash
sudo apt install ghc
```
- Rodar o seguinte comando dentro da pasta `src`.
```
ghc --make -o menu menu.hs -o blackjack blackjack.hs
```
- Executar o binario `blackjack` gerado.
```
./blackjack
```


## Uso 
Explique como usar seu projeto.
Procure ilustrar em passos, com apoio de telas do software, seja com base na interface gráfica, seja com base no terminal.
Nessa seção, deve-se revelar de forma clara sobre o funcionamento do software.

## Vídeo
Adicione 1 ou mais vídeos com a execução do projeto.
Procure: 
(i) Introduzir o projeto;
(ii) Mostrar passo a passo o código, explicando-o, e deixando claro o que é de terceiros, e o que é contribuição real da equipe;
(iii) Apresentar particularidades do Paradigma, da Linguagem, e das Tecnologias, e
(iV) Apresentar lições aprendidas, contribuições, pendências, e ideias para trabalhos futuros.
OBS: TODOS DEVEM PARTICIPAR, CONFERINDO PONTOS DE VISTA.
TEMPO: +/- 15min

## Participações
| Nome do Membro                           | Contribuição                                         | Significância da Contribuição para o Projeto (Excelente/Boa/Regular/Ruim/Nula) |
| ---------------------------------------- | ---------------------------------------------------- | ------------------------------------------------------------------------------ |
| Álvaro Gouveia -18/0012002		                                   | Programação Logica e funcionamento dos perfis dos jogadores, além de sistema de salvamento de dinheiro e adição basica do usuario padrão| Boa                                                                            |
| Antônio Ferreira de Castro Neto - 19/0044799	           |  Organização de Repositorio e participa da correção de Bugs envolvendo o Dealer e o funcionamento das cartas                                            | Boa                                                                            |
| Davi Matheus da Rocha de Oliveira - 19/0042419	         | Organização de Repositorio e Reorganização do ReadMe, Ajuda na Dockerização do projeto e na criação do makefile  ajuda na evolução da interface                                           | Boa                                                                            |
| Francisco Emanoel Ferreira   - 17/0142329	              | Criação do Docker e a integração do makefile no repositroio além de ajudar  funcionamento dos perfis dos jogadores  e do usuario padrão                           | Boa                                                                             |
|Guilherme Rogelin Vial	- 19/0014032	    |      Organização do Repositorio                                          | Boa                                                                       |
| Liverson Furtado Severo	- 18/0022237	            | Ajuda no codigo principal do perfil de jogadores além da correção principal do funcionamento padrão da aplicação, corrigindo a interção do player com o dealer                                              | Boa                                                                          |
| Matheus Filipe Faria Alves de Andrade	- 14/0155350	 | Organização do Repositorio                                                | Boa                                                                          |
| Natanael Fernandes Coelho Filho	- 19/0058650	                 | Ajuda no polimento geral do aplicativo, correção de bugs e programação logica da aplicação                                                | Boa                                                                         |

## Outros 
Quaisquer outras informações sobre o projeto podem ser descritas aqui. Não esqueça, entretanto, de informar sobre:
(i) Lições Aprendidas;
(ii) Percepções;
(iii) Contribuições e Fragilidades, e
(iV) Trabalhos Futuros.

## Fontes
- Learn You a Haskell for Great Good! Disponível em: [learnyourhaskell](http://learnyouahaskell.com/chapters)

- Projeto [Blackjack](https://github.com/UnBParadigmas2021-2/2021.2_G5_Funcional_Blackjack)

-