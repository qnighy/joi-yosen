import Control.Monad
import Data.List

main :: IO ()
main = do
        n <- (getLine >>= return.read)::IO Int
        k <- (getLine >>= return.read)::IO Int
        replicateM_ k (do
          [x,y] <- (getLine>>=return.map read.words)::IO [Int]
          putStrLn $ show $ 1+calc n (x-1) (y-1))

calc :: Int -> Int -> Int -> Int
calc n x y =
        let z = n-1-x in
        let w = n-1-y in
        (foldl min x [y,z,w]) `mod` 3
