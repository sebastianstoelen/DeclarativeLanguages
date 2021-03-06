--Haskell: Exercise session 2

data Tree a = Empty
        | Node a (Tree a) (Tree a)

data ChessPiece = ChessPiece String (Pos -> [Pos])

data Station a b = Machine ([(a,Int)] -> b)
        | Combine [Station a b]
