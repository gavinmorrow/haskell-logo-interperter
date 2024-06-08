module Main (main) where

import Ast
import Data.List (uncons)
import Graphics.Gloss

main :: IO ()
main = do
  stdin <- getContents
  let cs = commands stdin
  display (InWindow "Turtle" (500, 1000) (0, 0)) white (Text $ show cs)

commands :: String -> Maybe [Command]
commands = mapM (parseLine . words) . filter (/= "") . lines

data StackElem = C Command | N Number

parseLine :: [String] -> Maybe Command
parseLine l = do
  C c <- fmap fst $ uncons $ foldr f [] l
  return c
  where
    f :: String -> [StackElem] -> [StackElem]
    f "fd" (N x : xs) = C (Fd x) : xs
    f "bk" (N x : xs) = C (Bk x) : xs
    f "lt" (N x : xs) = C (Lt x) : xs
    f "rt" (N x : xs) = C (Rt x) : xs
    f "pu" xs = C Pu : xs
    f "pd" xs = C Pd : xs
    f n xs = N (Number $ read n) : xs
