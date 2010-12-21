import Control.Monad
import Data.List
import Data.Array

main :: IO ()
main = do
        n <- (getLine >>= return.read)::IO Int
        l <- (getLine >>= return.map read.words)::IO [Int]
        putStrLn $ show $ calc l

r :: (Int -> Integer) -> [Integer]
r f = map f (range (0,20))

calc :: [Int] -> Integer
calc (d:ds) = calc2 (r (\x -> (if (x==d) then 1 else 0) )) ds
-- calc (d:ds) = calc2 (r (const 0)) ds

calc2 :: [Integer] -> [Int] -> Integer
calc2 a [l] = a!!l
calc2 a (l:ls) =
        calc2 (r (\x -> (
         (if inRange (0,20) (x-l) then a!!(x-l) else 0) +
         (if inRange (0,20) (x+l) then a!!(x+l) else 0)
        )) ) ls



