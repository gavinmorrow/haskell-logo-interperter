module Turtle (Turtle) where

import Ast (Logo)

class Turtle a where
  run :: Logo -> a
