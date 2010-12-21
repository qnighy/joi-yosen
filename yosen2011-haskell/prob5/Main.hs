import Control.Monad
import Control.Monad.ST
import Data.STRef
import Data.List
import Data.Array
import Data.Maybe
import qualified Control.Exception as Exception

numchar :: [Char]
numchar = "S123456789"

main :: IO ()
main = do
        [h,w,n] <- (getLine >>= return.map read.words)::IO [Int]
        m <- replicateM h (getLine >>= return.head.words)
        putStrLn $ show $ [h,w,n]
        putStrLn $ show $ m
        putStrLn $ show $ findPoint m 0
        putStrLn $ show $ calc m (h,w) n

calc :: [String] -> (Int,Int) -> Int -> Int
calc m (h,w) n = foldl (+) 0 (map (\x->
        (calc2 m (h,w) (findPoint m x) (findPoint m (x+1)))
        ) (range (0,n-1)))

calc2 :: [String] -> (Int,Int) -> (Int,Int) -> (Int,Int) -> Int
calc2 m b s g =
        (search
        (rectArray b (\p->m!!fst p!!snd p))
        b [s] [] 0 (rectArray b (\p->if p==s then 0 else -1) )) ! g

search :: Array (Int,Int) Char -> (Int,Int) -> [(Int,Int)] -> [(Int,Int)] -> Int -> Array (Int,Int) Int -> Array (Int,Int) Int
search m (h,w) [] [] ct tim = tim
search m (h,w) [] q ct tim = search m (h,w) q [] (ct+1) tim
search m (h,w) ((y,x):q0) q1 ct tim =
        let nei = validNeighbors m (h,w) (y,x) in
        let nei' = filter (\p->(tim!p) == -1) nei in
        search m (h,w) q0 (nei'++q1) ct $! (tim // map (\p->(p,ct+1)) nei')

validNeighbors :: Array (Int,Int) Char -> (Int,Int) -> (Int,Int) -> [(Int,Int)]
validNeighbors m b (y,x) =
        filter (isValidPoint m b) [(y,x-1),(y,x+1),(y-1,x),(y+1,x)]

isValidPoint :: Array (Int,Int) Char -> (Int,Int) -> (Int,Int) -> Bool
isValidPoint m (h,w) (y,x) =
        0<=y && 0<=x && y<h && x<w && ((m!(y,x)) /= 'X')

findPoint :: [String] -> Int -> (Int,Int)
findPoint m i =
        let m0 = map (elemIndex (numchar!!i)) m in
        let y = fromMaybe 0 (findIndex isJust m0) in
        let x = fromMaybe 0 (m0!!y) in (y,x)

rectArray :: (Int,Int) -> ((Int,Int) -> a) -> Array (Int,Int) a
rectArray (w,h) f =
        let r = ((0,0),(w-1,h-1)) in
        array r (map (\p->(p,f p)) (range r))

(!!?) :: [a] -> Int -> Maybe a
[] !!? _ = Nothing
(x:xs) !!? 0 = Just x
(x:xs) !!? i = xs !!? (i-1)

