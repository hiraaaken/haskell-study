module ListOperations where

-- | リストから偶数のみをフィルタリング
filterEven :: [Int] -> [Int]
filterEven = filter even

-- | リストの要素の合計を計算
sumList :: Num a => [a] -> a
sumList = foldl (+) 0

-- | リストの最大値を探す
findMax :: Ord a => [a] -> Maybe a
findMax [] = Nothing
findMax xs = Just $ maximum xs

-- | 再帰を使用してリストを反転
reverseList :: [a] -> [a]
reverseList [] = []
reverseList (x:xs) = reverseList xs ++ [x]

-- | リストから重複を削除
removeDuplicates :: Eq a => [a] -> [a]
removeDuplicates [] = []
removeDuplicates (x:xs) = x : removeDuplicates (filter (/= x) xs)

-- | カスタム関数を使用して2つのリストをzip
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys 