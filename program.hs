module Main where
  
import Jam
  
data CoasterCase = CoasterCase {
  rides :: Int,
  seats :: Int,
  left :: Int,
  queue :: [Int],
  passengers :: [Int]
} deriving Show

computeCase :: CoasterCase -> Int
computeCase (CoasterCase 0 _ _ _ _) = 0
computeCase (CoasterCase r s l [] p) = computeCase (CoasterCase (r-1) s s p []) -- all groups entered -> new ride
computeCase (CoasterCase r s l grp@(g:gs) p)
  | g > l = computeCase (CoasterCase (r-1) s s (grp ++ p) []) -- train is full -> new ride
  | otherwise = g + (computeCase (CoasterCase r s (l-g) gs (p++[g]))) -- next group entersa
                                       
computeCases :: [CoasterCase] -> [String]
computeCases = map (show . computeCase)

readCases :: [String] -> [CoasterCase]
readCases [] = []
readCases (ch:grp:cases) = ((CoasterCase r s s g []):(readCases cases)) where
  [r, s, _] = map read (split ch) :: [Int]
  g = map read (split grp) :: [Int]

compute :: [String] -> [String]
compute (num:cases) = (computeCases . readCases) cases

main = interact (unlines . encase . compute . lines) where