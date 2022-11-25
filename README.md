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

O Blackjack ou 21 é um jogo de cartas jogado tradicionalmente nos casinos com 1 a 8 baralhos de 52 cartas cada. As cartas possuem seus valores: 

- do _2 ao 10_ os valores são respectivos ao número da carta, o _2_ vale 2 pontos, o _3_ vale 3 pontos e assim por diante.
- As cartas com as letras _J, Q_ e _K_ valem 10 pontos.
- A carta _A_ vale 11 pontos ou 1 ponto, de acordo com a necessidade da aposta.

O objetivo é ter mais pontos que o Dealer, mas não ultrapassando os 21 pontos pois esse é caso em que se perde.

Nosso objetivo principal será a implementação de um modo multijogador para o jogo, além de melhorias gerais.

## Uso e Screenshots

Ao iniciar o jogo, escolha suas opções com base do Menu Inicial. Crie um usuário com seu nome e selecione _Iniciar partida_ para começar o jogo.

Primeiramente consulte as regras do jogo no ReadMe do projeto, depois escolha o valor da sua aposta e boa sorte! 

```
menu "interativo da aplicação
```
<a href="https://ibb.co/RC1Py1T"><img src="https://i.ibb.co/fCbtvbd/Captura-de-tela-de-2022-11-24-23-30-10.png" alt="Captura-de-tela-de-2022-11-24-23-30-10" border="0"></a>

Iniciando a partida, analise sua mão e a carta mostrada do Dealer.

```
iniciando Partida
```
<a href="https://ibb.co/714SCrx"><img src="https://i.ibb.co/YLZNQf4/Captura-de-tela-de-2022-11-24-23-35-36.png" alt="Captura-de-tela-de-2022-11-24-23-35-36" border="0"></a><br /><a target='_blank' href='https://pt-br.imgbb.com/'>site de criar fotos</a><br />

No decorrer do jogo, você pode dobrar sua aposta, comprar outra carta ou fechar suas cartas.

Ao final de cada partida será mostrado se você ganhou ou perdeu a aposta, e o total do seu dinheiro. A partir daí, você pode começar outra partida ou salvar o jogo e fechar.

```
Finalizando Partida
```
<a href="https://ibb.co/SwMVw2H"><img src="https://i.ibb.co/ZzFcz3v/Captura-de-tela-de-2022-11-24-23-37-36.png" alt="Captura-de-tela-de-2022-11-24-23-37-36" border="0"></a>

## Instalação 
**Linguagens**: Haskell<br>
**Tecnologias**: GHCI e Makefile<br>

- Instalar o GHC
```bash
sudo apt install ghc
```
- Instalar o make
```bash
sudo apt install make
```

**Primeira forma de executar o projeto**

Atenção: Verifiqu que você esteja dentro da pasta `/src`

```
make start
```

**Segunda forma de executar o projeto**
```
ghc --make -o menu menu.hs -o blackjack blackjack.hs

./blackjack
```

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

- Regras do jogo Blackjack: [Regras](https://www.youtube.com/watch?v=I1fKYgDDDM4)