module Ast (Logo, Command (..), Number, cmd1) where

type Logo = [Command]

data Command = Fd Number | Bk Number | Lt Number | Rt Number | Pu | Pd deriving (Show)

cmd1 :: String -> Number -> Command
cmd1 "fd" = Fd
cmd1 "bk" = Bk
cmd1 "lt" = Lt
cmd1 "rt" = Rt
cmd1 c = error $ "Unknown command " ++ c

type Number = Int
