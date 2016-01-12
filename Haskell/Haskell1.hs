--Haskell: Exercise session 1

--1: Hors d'Oevres

myLast::[Int] -> Int
myLast [x] = x
myLast (_:xs) = myLast xs

myRepeat:: Int -> Int -> [Int]
myRepeat 0 _ = []
myRepeat n x = x : myRepeat (n-1) x

flatten:: [[Int]] -> [Int]
flatten [] = []
flatten (x:xs) = x ++ flatten xs

range:: Int -> Int -> [Int]
range x y 
        | x > y = []
        | otherwise = x : range (x+1) y

removeMultiples:: Int -> [Int] -> [Int]
removeMultiples _ [] = []
removeMultiples n (x:xs)
        | x `mod` n == 0 = recurse
        | otherwise = x : recurse
        where recurse = removeMultiples n xs


--2: Folds

mySum:: [Int] -> Int
mySum [] = 0
mySum (x:xs) = x + mySum xs

myProduct:: [Int] -> Int
myProduct [] = 1
myProduct (x:xs) = x * myProduct xs

fold:: (a -> a -> a) -> a -> [a] -> a
fold f s [] = s
fold f s (x:xs) = f x (fold f s xs)

readInBase:: Int -> [Int] -> Int
readInBase b = foldl (\acc x -> acc*b+x) 0

myMap:: (a -> b) -> [a] -> [b]
myMap f = foldr (\x acc -> (f x):acc) [] 


--3: Unpair

unpair:: [(a,b)] -> ([a],[b])
unpair xs = (map fst xs, map snd xs)

unpair2:: [(a,b)] -> ([a],[b])
unpair2 [] = ([],[])
unpair2 ((x,y):rest) = (x:xs,y:ys)
        where (xs,ys) = unpair2 rest

unpair3:: [(a,b)] -> ([a],[b])
unpair3 = foldr (\(x,y) (xs,ys) -> (x:xs,y:ys)) ([],[])


--4: Transpose

transpose::[[a]] -> [[a]]
transpose ([]:_) = []
transpose = map head xs : transpose (map tail xs)


--5: Prime Numbers

sieve:: Int -> [Int]
sieve x = removeNonPrime [2..x]

removeNonPrime:: [Int] -> [Int]
removeNonPrime []  = []
removeNonPrime (x:xs) = x : removeNonPrime(removeMultiples x xs)

sieve2:: Int -> [Int]
sieve2 x = removeNonPrime2 [2..x] (floor (sqrt x))

removeNonPrime2:: [Int] -> Int -> [Int]
removeNonPrime2 (x:xs) u
        | x =< u = x : removeNonPrime2 (removeMultiples x xs) u
        | otherwise = x:xs






