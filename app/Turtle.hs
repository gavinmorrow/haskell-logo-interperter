module Turtle (Turtle) where

import Ast (Command)

class Turtle a where
  run :: [Command] -> a
