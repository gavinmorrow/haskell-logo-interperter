module Main (main) where

import Ast
import Text.Read (readMaybe)
import Turtle

main :: IO ()
main = getLine >>= (print . commands)

commands :: String -> Maybe [Command]
commands = parse . words

parse :: [String] -> Maybe [Command]
parse [] = Nothing
parse ("pu" : xs) = parse xs >>= \xs' -> Just $ Pu : xs'
parse ("pd" : xs) = parse xs >>= \xs' -> Just $ Pd : xs'
parse (c : x : xs) = do
  x' <- readMaybe x
  xs' <- parse xs
  return (cmd1 c x' : xs')
parse _ = error "Unknown"
