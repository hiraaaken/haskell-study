module Types where

-- | 人物を表すデータ型
data Person = Person
    { name :: String
    , age  :: Int
    } deriving (Show, Eq)

-- | 図形を表すデータ型
data Shape
    = Circle Double
    | Rectangle Double Double
    | Triangle Double Double Double
    deriving (Show, Eq)

-- | 図形の面積を計算
area :: Shape -> Double
area (Circle r) = pi * r * r
area (Rectangle w h) = w * h
area (Triangle a b c) = let -- ヘロンの公式を使用
    s = (a + b + c) / 2
    in sqrt (s * (s - a) * (s - b) * (s - c))

-- | 人物のリストから最年長者を探す例（Maybe型の使用）
findOldestPerson :: [Person] -> Maybe Person
findOldestPerson [] = Nothing
findOldestPerson people = Just $ foldr1 (\p1 p2 -> if age p1 > age p2 then p1 else p2) people

-- | 安全な除算の例（Either型の使用）
safeDivide :: Double -> Double -> Either String Double
safeDivide _ 0 = Left "0による除算はできません！"
safeDivide x y = Right (x / y)

-- | カスタム型クラスの例
class Describable a where
    describe :: a -> String

instance Describable Person where
    describe person = name person ++ "は" ++ show (age person) ++ "歳です"

instance Describable Shape where
    describe (Circle r) = "半径" ++ show r ++ "の円"
    describe (Rectangle w h) = show w ++ "x" ++ show h ++ "の長方形"
    describe (Triangle a b c) = "辺の長さが" ++ show a ++ "、" ++ show b ++ "、" ++ show c ++ "の三角形" 