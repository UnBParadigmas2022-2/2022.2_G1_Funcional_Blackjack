-- import Blackjack
{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
import Blackjack
import Control.Monad
import Data.Char
import Data.Typeable
import System.Exit
import System.IO
import System.Random
import System.Directory

main :: IO ()
main = do
  putStr "Bem-vindo ao BlackJack\nInforme seu nome: "
  hFlush stdout
  nome <- getLine
  handle <- openFile "game.txt" ReadWriteMode
  fileParser nome handle

-- Atravessa o arquivo procurando o nome igual e confere a senha
fileParser :: String -> Handle -> IO ()
fileParser nome handle = do
  isFileEnd <- hIsEOF handle
  if isFileEnd 
    then do
      putStr "Nao foi encontrado um usuario com esse nome, deseja criar um novo usuario?\n1 - Sim\n2 - Nao\n"
      option <- getLine
      case option of
        "1" -> do
            hClose handle
            putStr "Defina sua senha: "
            hFlush stdout
            password <- getLine
            appendFile "game.txt" (nome++"\n")
            appendFile "game.txt" ("2000\n")
            appendFile "game.txt" (password++"\n")
            putStrLn ("Pronto! Seja Bem-Vindo "++nome++"!")
            mainMenu nome 2000
        "2" -> do
            putStrLn "O sistema esta sendo finalizado"
  else
    do
      fileName <- hGetLine handle
      fileMoney <- hGetLine handle
      filePass <- hGetLine handle
      -- Trata a linha
      if fileName == nome
        then do
          hClose handle
          putStrLn ("Bem vindo de volta "++nome++"!")
          putStr "Para continuar, informe sua senha: "
          hFlush stdout
          senha <- getLine
          if senha == filePass
            then do
              mainMenu nome (read fileMoney::Int)
          else do
            putStrLn "Senha incorreta!\nFinalizando sistema!"
        else do
          fileParser nome handle

      

mainMenu :: String -> Int -> IO ()
mainMenu nome money = do
  if money <= 0
    then putStrLn "Você faliu...\n"
  else do
    putStrLn "Menu Principal do Jogo: "
    putStrLn "1 - Iniciar partida"
    putStrLn "2 - Salvar"
    putStrLn "3 - Fechar\n"
    option <- getLine
    case option of
      "1" -> startGameMenu nome money
      "2" -> do
        handle <- openFile "game.txt" ReadWriteMode
        saveGame nome money 0 [] handle
        hClose handle
      "3" -> putStrLn "O jogo esta sendo finalizado...\n"

-- Funcao de append de lista tirada do site https://www.educative.io/answers/how-to-append-an-element-to-a-haskell-list
-- Funcao alterada de Int para String
append :: String -> [String] -> [String]
append a xs = xs ++ [a]

saveGame :: String-> Int -> Int -> [String] -> Handle -> IO ()
saveGame nome money counter list handle = do
  isFileEnd <- hIsEOF handle
  if isFileEnd && (counter == 0)
    then do
      putStrLn "O sistema foi reiniciado e seu usuario apagado, por favor recrie."
  else if isFileEnd && (counter /= 0) 
    then do
      hClose handle
      removeFile "game.txt"
      handle <- openFile "game.txt" ReadWriteMode
      hClose handle
      listPrintIterate list 0
  else do
    nameLine <- hGetLine handle
    if (nameLine == nome)
      then do
        moneyLine <- hGetLine handle
        passwordLine <- hGetLine handle
        let nameList = append nome list
        let moneyList = append (show money) nameList
        let newList = append passwordLine moneyList
        saveGame nome money (counter+1) newList handle
    else do
      moneyLine <- hGetLine handle
      passwordLine <- hGetLine handle
      let nameList = append nameLine list
      let moneyList = append moneyLine nameList
      let newList = append passwordLine moneyList
      saveGame nome money (counter+1) newList handle

listPrintIterate :: [String] -> Int-> IO ()
listPrintIterate list index = do
  if index < length list
    then do
      appendFile "game.txt" ((list !! index)++"\n")
      listPrintIterate list (index+1)
  else
    putStrLn "O jogo esta sendo finalizado...\n"


startGameMenu :: String -> Int -> IO ()
startGameMenu nome money = do
  putStrLn $ "Seu dinheiro: $ " ++ show money
  putStrLn "\nEscolha sua acao: "
  putStrLn "1 - Apostar 10"
  putStrLn "2 - Apostar 50"
  putStrLn "3 - Apostar 100"
  putStrLn "4 - Apostar 250"
  putStrLn "5 - Apostar 500"
  putStrLn "6 - Voltar para o menu principal\n"
  
  option <- getLine
  deckShuffled <- shuffle deck
  let playerHand = head deckShuffled : [deckShuffled !! 1]
  let dealerHand = [deckShuffled !! 2]
  let counter = 3
  let _deckShuffled = drop counter deckShuffled

  case option of
    "1" -> do
      if (money - 10) < 0
        then do
          putStrLn "Dinheiro insuficiente para a aposta minima. Voltando para o menu principal..." 
          mainMenu nome money
      else do
        putStrLn $ "Apostando: " ++ show 10
        inGameMenu nome 10 (money -10) playerHand dealerHand _deckShuffled
    "2" -> do
      if (money - 50) < 0
        then do
          putStrLn "Dinheiro insuficiente!" 
          startGameMenu nome money
      else do
        putStrLn $ "Apostando: " ++ show 50
        inGameMenu nome 50 (money - 50) playerHand dealerHand _deckShuffled
    "3" -> do
      if (money - 100) < 0
        then do
          putStrLn "Dinheiro insuficiente!" 
          startGameMenu nome money
      else do
        putStrLn $ "Apostando: " ++ show 100
        inGameMenu nome 100 (money - 100) playerHand dealerHand _deckShuffled
    "4" -> do
      if (money - 250) < 0
        then do
          putStrLn "Dinheiro insuficiente!" 
          startGameMenu nome money
      else do
        putStrLn $ "Apostando: " ++ show 250
        inGameMenu nome 250 (money - 250) playerHand dealerHand _deckShuffled
    "5" -> do
      if (money - 500) < 0
        then do
          putStrLn "Dinheiro insuficiente!" 
          startGameMenu nome money
      else do
        putStrLn $ "Apostando: " ++ show 500
        inGameMenu nome 500 (money - 500) playerHand dealerHand _deckShuffled
    "6" -> do
        putStrLn "Voltando para o menu...\n"
        mainMenu nome money
    _ ->startGameMenu nome money


inGameMenu :: String -> Int -> Int -> [([Char], Char)] -> [([Char], Char)] -> [([Char], Char)] -> IO ()
inGameMenu nome bet totalMoney playerHand dealerHand deckShuffled = do
  putStrLn $ "\nSua mão:\n" ++ (printHand playerHand)
  putStrLn $ "Mão do dealer:\n" ++ (printHand dealerHand)

  compareHandValuesOverOrEqual21 playerHand dealerHand bet totalMoney nome
  putStrLn $ "Seu dinheiro: $ " ++ show totalMoney
  putStrLn $ "\n----------------------------------------\n" ++ "Escolha sua acao: "
  putStrLn "1 - Dobrar aposta"
  putStrLn "2 - Comprar carta"
  putStrLn "3 - Fechar mao\n"
  option <- getLine
  case option of
    "1" -> do
      if (totalMoney - bet) < 0
        then do
          putStrLn "Dinheiro insuficiente para dobrar a aposta"
          inGameMenu nome bet totalMoney playerHand dealerHand deckShuffled
        else do
          putStrLn $ "Dobrando aposta... Valor atual: " ++ show (bet * 2)
          let _playerHand = head deckShuffled : playerHand
          inGameMenu nome (bet * 2) (totalMoney - bet) _playerHand dealerHand (drop 1 deckShuffled)
    "2" -> do
      let _playerHand = head deckShuffled : playerHand

      let handValuePlayer = getHandValue _playerHand
      let handValueDealer = getHandValue dealerHand
      if handValueDealer < handValuePlayer
        then do
          let _dealerHand = head (drop 1 deckShuffled) : dealerHand
          inGameMenu nome bet totalMoney _playerHand _dealerHand (drop 2 deckShuffled)
        else do
          inGameMenu nome bet totalMoney _playerHand dealerHand (drop 1 deckShuffled)

    "3" -> do
      putStrLn "Fechando mao...\n"

      let handValuePlayer = getHandValue playerHand
      let handValueDealer = getHandValue dealerHand
      if handValueDealer < handValuePlayer
        then do
          let _dealerHand = head deckShuffled : dealerHand
          compareHandValuesOverOrEqual21 playerHand _dealerHand bet totalMoney nome
          compareHandValues playerHand _dealerHand bet totalMoney nome
          mainMenu nome totalMoney
        else do
          compareHandValuesOverOrEqual21 playerHand dealerHand bet totalMoney nome
          compareHandValues playerHand dealerHand bet totalMoney nome
          mainMenu nome totalMoney

compareHandValuesOverOrEqual21 :: [([Char], Char)] -> [([Char], Char)] -> Int -> Int -> String -> IO ()
compareHandValuesOverOrEqual21 hand dealerHand bet totalMoney nome = do
  let handValue = getHandValue hand
      handValueDealer = getHandValue dealerHand
  putStrLn $ "Valor da sua mão " ++ show handValue
  putStrLn $ "Valor da mão do dealer " ++ show handValueDealer
  if handValue > 21 || handValueDealer == 21
    then do
      putStrLn "Dealer venceu\n"
      mainMenu nome totalMoney
      exitSuccess
    else
      if handValueDealer > 21 || handValue == 21
        then do
          putStrLn "Você venceu\n"
          putStrLn $ "Seu dinheiro: $ " ++ show (totalMoney + (2 * bet)) ++ "\n"
          mainMenu nome (totalMoney + (2 * bet))
          exitSuccess
        else do
          putStrLn ""

compareHandValues :: [([Char], Char)] -> [([Char], Char)] -> Int -> Int -> String -> IO ()
compareHandValues hand dealerHand bet totalMoney nome = do
  let handValue = getHandValue hand
      handValueDealer = getHandValue dealerHand
  if handValueDealer > handValue
    then do
      putStrLn "Dealer venceu\n"
      mainMenu nome totalMoney
      exitSuccess
    else
      if handValue > handValueDealer
        then do
          putStrLn "Você venceu\n"
          putStrLn $ "Seu dinheiro: $ " ++ show (totalMoney + (2 * bet)) ++ "\n"
          mainMenu nome (totalMoney + (2 * bet))
          exitSuccess
        else do
          putStrLn "Empate\n"
          putStrLn $ "Seu dinheiro: $ " ++ show (totalMoney + bet) ++ "\n"
          mainMenu nome (totalMoney + bet)
          exitSuccess

getHandValue :: [(a, Char)] -> Int
getHandValue = foldr ((+) . assignValueToCard) 0

assignValueToCard :: (a, Char) -> Int
assignValueToCard x = do
  case (snd x) of
    y | y == 'J' || y == 'Q' || y == 'K' || y == 'X' -> 10
    'A' -> 1
    _ -> digitToInt (snd x)