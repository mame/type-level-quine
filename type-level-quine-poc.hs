-- Type-level Quine  (c) Yusuke Endoh 2013

{-# LANGUAGE FunctionalDependencies, UndecidableInstances, FlexibleInstances, FlexibleContexts, TypeOperators, ScopedTypeVariables #-}

module Main where

class I x y | x -> y where i :: x -> Int
data X0; instance I X0 (X3,X0) where i _ =  0
data X1; instance I X1 (X3,X1) where i _ =  1
data X2; instance I X2 (X3,X2) where i _ =  2
data X3; instance I X3 (X3,X3) where i _ =  3
data X4; instance I X4 (X3,X4) where i _ =  4
data X5; instance I X5 (X3,X5) where i _ =  5
data X6; instance I X6 (X3,X6) where i _ =  6
data X7; instance I X7 (X3,X7) where i _ =  7
data X8; instance I X8 (X3,X8) where i _ =  8
data X9; instance I X9 (X3,X9) where i _ =  9
data Xa; instance I Xa (X6,X1) where i _ = 10
data Xb; instance I Xb (X6,X2) where i _ = 11
data Xc; instance I Xc (X6,X3) where i _ = 12
data Xd; instance I Xd (X6,X4) where i _ = 13
data Xe; instance I Xe (X6,X5) where i _ = 14
data Xf; instance I Xf (X6,X6) where i _ = 15

data E
data a:-b
infixr :-

class Q a b c | a b -> c
instance (Q X1 a c, Q a c b) => Q X0 b a
instance Q X1 E ((X4,X5):-(X2,X9):-(X2,X0):-(X3,Xd):-(X3,Xe):-(X2,X0):-(X6,X2):-(X0,Xa):-E)
instance (Q X1 a b, I x p, I y q) => Q X1 ((x,y):-a) ((X2,X8):-(X5,X8):-p:-(X2,Xc):-(X5,X8):-q:-(X2,X9):-(X3,Xa):-(X2,Xd):-b)
instance Q E b b
instance Q a b c => Q (x:-a) b (x:-c)

instance Show E where show _ = ""
instance (I x p, I y q, Show b) => Show ((x,y):-b) where
  show (_ :: (x,y):-b) = toEnum (i (undefined :: x) * 16 + i (undefined :: y)) : show (undefined :: b)

main = putStr $ show quine
quine = undefined :: Q X0 b ((X2,Xd):-(X2,Xd):-(X2,X0):-(X5,X4):-(X7,X9):-(X7,X0):-(X6,X5):-(X2,Xd):-(X6,Xc):-(X6,X5):-(X7,X6):-(X6,X5):-(X6,Xc):-(X2,X0):-(X5,X1):-(X7,X5):-(X6,X9):-(X6,Xe):-(X6,X5):-(X2,X0):-(X2,X0):-(X2,X8):-(X6,X3):-(X2,X9):-(X2,X0):-(X5,X9):-(X7,X5):-(X7,X3):-(X7,X5):-(X6,Xb):-(X6,X5):-(X2,X0):-(X4,X5):-(X6,Xe):-(X6,X4):-(X6,Xf):-(X6,X8):-(X2,X0):-(X3,X2):-(X3,X0):-(X3,X1):-(X3,X3):-(X0,Xa):-(X0,Xa):-(X2,Xd):-(X2,Xd):-(X2,X0):-(X7,X3):-(X6,Xe):-(X6,X9):-(X7,X0):-(X2,X1):-(X0,Xa):-(X0,Xa):-(X6,Xd):-(X6,X1):-(X6,X9):-(X6,Xe):-(X2,X0):-(X3,Xd):-(X2,X0):-(X7,X0):-(X7,X5):-(X7,X4):-(X5,X3):-(X7,X4):-(X7,X2):-(X2,X0):-(X2,X4):-(X2,X0):-(X7,X3):-(X6,X8):-(X6,Xf):-(X7,X7):-(X2,X0):-(X7,X1):-(X7,X5):-(X6,X9):-(X6,Xe):-(X6,X5):-(X0,Xa):-(X7,X1):-(X7,X5):-(X6,X9):-(X6,Xe):-(X6,X5):-(X2,X0):-(X3,Xd):-(X2,X0):-(X7,X5):-(X6,Xe):-(X6,X4):-(X6,X5):-(X6,X6):-(X6,X9):-(X6,Xe):-(X6,X5):-(X6,X4):-(X2,X0):-(X3,Xa):-(X3,Xa):-(X2,X0):-(X5,X1):-(X2,X0):-(X5,X8):-(X3,X0):-(X2,X0):-(X6,X2):-(X2,X0):-(X2,X8):-E) => b
