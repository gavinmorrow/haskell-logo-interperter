module Main (main) where

import Ast
import Data.List (uncons)

main :: IO ()
main = getContents >>= (print . commands)

commands :: String -> [Maybe Command]
commands = fmap (parseLine . words) . lines

data StackElem = C Command | N Number

-- TODO: use nonempty for line
parseLine :: [String] -> Maybe Command
parseLine l = case fmap fst $ uncons $ foldr f [] l of
  Just (C c) -> Just c
  Just (N n) -> error $ "Number:" ++ show n
  Nothing -> error "empty line"
  where
    f :: String -> [StackElem] -> [StackElem]
    f "fd" (N x : xs) = C (Fd x) : xs
    f "bk" (N x : xs) = C (Bk x) : xs
    f "lt" (N x : xs) = C (Lt x) : xs
    f "rt" (N x : xs) = C (Rt x) : xs
    f "pu" xs = C Pu : xs
    f "pd" xs = C Pd : xs
    f n xs = N (Number $ read n) : xs
