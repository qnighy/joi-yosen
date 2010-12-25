import Control.Monad
import Control.Monad.ST
import Data.List
import Data.Maybe
import Data.Array.ST
import Data.Array.MArray
import Data.STRef
import Debug.Trace

numchar :: [Char]
numchar = "S123456789"

main :: IO ()
main = do
        [h,w,n] <- (getLine >>= return.map read.words)::IO [Int]
        m <- replicateM h (getLine >>= return.head.words)
        putStrLn $ show $ calc (concat m) (h,w) n

calc :: String -> (Int,Int) -> Int -> Int
calc m dim n = foldl (+) 0 $ map (\x->calc2 m dim
        (fromMaybe 0 $ elemIndex (numchar!!x) m)
        (fromMaybe 0 $ elemIndex (numchar!!(x+1)) m)
        ) [0..n-1]

calc2 :: String -> (Int,Int) -> Int -> Int -> Int
calc2 m (w,h) s g = runST $ do
        qsR <- newSTRef 0
        qeR <- newSTRef 1
        q <- (newArray (0,w*h) 0)::ST s (STUArray s Int Int)
        tim <- newArray (0,w*h) (-1)
        writeArray q 0 s
        writeArray tim s 0
        bfs m (w,h) q qsR qeR tim
        readArray tim g

bfs :: String -> (Int,Int) -> STUArray s Int Int -> STRef s Int -> STRef s Int -> STUArray s Int Int -> ST s ()
bfs m dim q qsR qeR tim = do
        qs <- readSTRef qsR
        qe <- readSTRef qeR
        if qs==qe then return () else do
          cur <- readArray q qs
          curtim <- readArray tim cur
          modifySTRef qsR (+1)
          forM_ (neighbors dim cur) (\nei-> do
            t <- readArray tim nei
            if t>=0 || m!!nei=='X' then return () else do
              qe' <- readSTRef qeR
              writeArray q qe' nei
              modifySTRef qeR (+1)
              writeArray tim nei (curtim+1)
            )
          bfs m dim q qsR qeR tim

neighbors :: (Int,Int) -> Int -> [Int]
neighbors dim p =
        let (y,x) = posToXY dim p in
        mapMaybe (xyToPos dim) [(y,x-1),(y,x+1),(y-1,x),(y+1,x)]

posToXY :: (Int,Int) -> Int -> (Int,Int)
posToXY (h,w) p = divMod p w

xyToPos :: (Int,Int) -> (Int,Int) -> Maybe Int
xyToPos (h,w) (y,x) = do
        guard $ 0<=x
        guard $ 0<=y
        guard $ x<w
        guard $ y<h
        return (y*w+x)

