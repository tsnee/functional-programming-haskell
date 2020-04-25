import System.Random

main :: IO ()
main = do
    randomNumber <- getStdRandom (randomR (1,10))
    let game = mkGame randomNumber
    play game

mkGame :: Int -> (Int -> Bool)
mkGame answer = \guess -> guess == answer

play :: (Int -> Bool) -> IO ()
play game = do
    putStr "Guess a number between 1 and 10: "
    guessStr <- getLine
    let guessNum = read guessStr :: Int
    if game guessNum
        then putStrLn "You win!"
        else play game
