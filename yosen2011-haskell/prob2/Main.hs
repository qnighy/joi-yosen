import Control.Monad
import Data.List
import Data.Char

trim :: String -> String
trim = f . f where f = reverse . dropWhile isSpace

main :: IO ()
main = do
        str <- (getLine>>=return.trim)
        n <- (getLine >>= return.read)::IO Int
        rings <- replicateM n (getLine>>=return.trim)
        putStrLn $ show (calc str rings)

calc :: String -> [String] -> Int
calc str rings = length $ filter (ringInclude str) rings

ringInclude :: String -> String -> Bool
ringInclude str ring = str `isInfixOf` (ring++ring)

