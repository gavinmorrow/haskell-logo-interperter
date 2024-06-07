module Ast (Command (..), Number (..)) where

data Command = Fd Number | Bk Number | Lt Number | Rt Number | Pu | Pd deriving (Show)

newtype Number = Number Int deriving (Show)
