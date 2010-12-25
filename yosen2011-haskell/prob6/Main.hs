import Control.Monad
import Data.List
import Data.Maybe
import qualified Data.Array as Array
import Data.Map (Map)
import qualified Data.Map as Map
import Data.Set (Set)
import qualified Data.Set as Set
import Debug.Trace

data DPT = DPV Int | DPS DPT DPT deriving (Eq, Show)

(+%) :: Int -> Int -> Int
a +% b = (a+b) `mod` 100000

main :: IO ()
main = do
        [m,n] <- (getLine >>= return.map read.words)::IO [Int]
        s <- replicateM m (getLine >>= return.head.words)
        putStrLn $ show $ calc (n-1) (concatWithX s)

concatWithX :: [String] -> [(Char,Bool)]
concatWithX s = concat $ map (\l->zip l (True:repeat False)) s

calc :: Int -> [(Char,Bool)] -> Int
calc n s = dpSum (foldl (\x (c,_)->if c=='?' then (x+%x+%x) else x) 1 s) $
        foldl (dpNext n) (dptInit n 99999,dptInit n 0,dptInit n 0) s

dpSum :: Int -> (DPT,DPT,DPT) -> Int
dpSum i (dpI,dpO,dpJ) = foldl' (+%) i $ map (dpSum' 0) [dpI,dpO,dpJ]
        where
          dpSum' 0 (DPS dpt0 dpt1) = dpSum' 0 dpt0 +% dpSum' 1 dpt1
          dpSum' 1 (DPS dpt0 _) = dpSum' 0 dpt0
          dpSum' _ (DPV x) = x

dpNext :: Int -> (DPT,DPT,DPT) -> (Char,Bool) -> (DPT,DPT,DPT)
dpNext n (dpI,dpO,dpJ) (c,leftmost) = (DPS
        (dptNext (n-1) 0 'I' c leftmost dpI dpO dpJ)
        (dptNext (n-1) 1 'I' c leftmost dpI dpO dpJ), DPS
        (dptNext (n-1) 0 'O' c leftmost dpI dpO dpJ)
        (dptNext (n-1) 1 'O' c leftmost dpI dpO dpJ), DPS
        (dptNext (n-1) 0 'J' c leftmost dpI dpO dpJ)
        (dptNext (n-1) 1 'J' c leftmost dpI dpO dpJ) )

dptNext :: Int -> Int -> Char -> Char -> Bool -> DPT -> DPT -> DPT -> DPT
dptNext 0 msb color c leftmost dpI dpO dpJ = DPV $
        foldl (\amount r-> (+% amount) $
          if msb /= (if r=='J' && color=='O' && not leftmost then 1 else 0)
          then 0
          else
            let (DPS (DPV x) (DPV y)) = charCond r dpI dpO dpJ in
            if color=='I' then x else x +% y
        ) 0 ['I','O','J']
dptNext n msb color c leftmost (DPS dpI0 dpI1) (DPS dpO0 dpO1) (DPS dpJ0 dpJ1) =
        if color/=c && c/='?' then dptInit n 0
        else
          DPS
          (dptNext (n-1) msb color c leftmost dpI0 dpO0 dpJ0)
          (dptNext (n-1) msb color c leftmost dpI1 dpO1 dpJ1)

charCond :: Char -> DPT -> DPT -> DPT -> DPT
charCond 'I' dpI _ _ = dpI
charCond 'O' _ dpO _ = dpO
charCond 'J' _ _ dpJ = dpJ

dptInit :: Int -> Int -> DPT
dptInit 0 x = DPV x
dptInit n x = DPS (dptInit (n-1) x) (dptInit (n-1) 0)

