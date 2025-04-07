module Main where

-- | 基本的な算術関数の例
add :: Num a => a -> a -> a
add x y = x + y

multiply :: Num a => a -> a -> a
multiply x y = x * y

-- | 文字列操作の例
greet :: String -> String
greet name = "Hello, " ++ name ++ "!"

-- | リスト処理の例
doubleList :: [Int] -> [Int]
doubleList = map (*2)

-- | メイン関数と実行例
main :: IO ()
main = do
    putStrLn "基本的なHaskellの例"
    putStrLn "---------------------"
    
    -- 算術の例
    putStrLn $ "5と3の加算: " ++ show (add 5 3)
    putStrLn $ "4と6の乗算: " ++ show (multiply 4 6)
    
    -- 文字列の例
    putStrLn $ greet "Haskell開発者"
    
    -- リスト処理の例
    let numbers = [1..5]
    putStrLn $ "元のリスト: " ++ show numbers
    putStrLn $ "2倍にしたリスト: " ++ show (doubleList numbers) 