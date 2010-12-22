import Control.Monad
import Data.List
import Data.Maybe
import qualified Data.Array as Array
import Data.Map (Map)
import qualified Data.Map as Map
import Data.Set (Set)
import qualified Data.Set as Set
import Debug.Trace

numchar :: [Char]
numchar = "S123456789"

main :: IO ()
main = do
        [h,w,n] <- (getLine >>= return.map read.words)::IO [Int]
        m <- replicateM h (getLine >>= return.head.words)
        -- putStrLn $ show $ [h,w,n]
        -- putStrLn $ show $ m
        -- putStrLn $ show $ findPoint m 0
        -- putStrLn $ show $ calc2 m (h,w) (findPoint m 0) (findPoint m 1)
        putStrLn $ show $ calc m (h,w) n

calc :: [String] -> (Int,Int) -> Int -> Int
calc m (h,w) n = foldl (+) 0 (map (\x->
        (("stage "++show x) `trace` calc2 m (h,w) (findPoint m x) (findPoint m (x+1)))
        ) (Array.range (0,n-1)))

calc2 :: [String] -> (Int,Int) -> (Int,Int) -> (Int,Int) -> Int
calc2 m (h,w) s g =
        (search
        (Set.fromList [(y,x) | (y,x) <- Array.range ((0,0),(h-1,w-1)), m!!y!!x/='X', (y,x)/=s])
        [s] [] 0 g )

search :: Set (Int,Int) -> [(Int,Int)] -> [(Int,Int)] -> Int -> (Int,Int) -> Int
search r [] [] ct g = -1
search r [] q ct g = search r q [] (ct+1) g
search r ((y,x):q0) q1 ct g =
        -- r `seq`
        -- y `seq`
        -- x `seq`
        -- q0 `seq`
        -- q1 `seq`
        -- ct `seq`
        -- g `seq`
        -- (show (y,x,length q0,length q1,ct)) `trace`
        if (y,x) == g then
          ct
        else
          let nei = filter (`Set.member` r) [(y,x-1),(y,x+1),(y-1,x),(y+1,x)] in
          -- nei `seq`
          let rr = (foldl (\z w->Set.delete w z) r nei) in
          -- rr `seq`
          -- (nei++q1) `seq`
          search rr q0 (nei++q1) ct g

findPoint :: [String] -> Int -> (Int,Int)
findPoint m i =
        let m0 = map (elemIndex (numchar!!i)) m in
        let y = fromMaybe 0 (findIndex isJust m0) in
        let x = fromMaybe 0 (m0!!y) in (y,x)

(!!?) :: [a] -> Int -> Maybe a
[] !!? _ = Nothing
(x:xs) !!? 0 = Just x
(x:xs) !!? i = xs !!? (i-1)

