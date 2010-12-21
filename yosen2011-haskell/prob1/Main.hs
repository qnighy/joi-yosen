
main :: IO ()
main = do
        a <- (getLine >>= return.read)::IO Int
        b <- (getLine >>= return.read)::IO Int
        c <- (getLine >>= return.read)::IO Int
        d <- (getLine >>= return.read)::IO Int
        sec <- return (a+b+c+d)
        putStrLn $ show (sec `div` 60)
        putStrLn $ show (sec `mod` 60)


