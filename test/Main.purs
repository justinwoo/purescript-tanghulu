module Test.Main where

import Prelude

import Effect (Effect)
import Tanghulu as T
import Test.Assert (assert)
import Type.Prelude (SProxy(..))

-- resultAdd :: SProxy "......."
resultAdd :: SProxy T.Seven
resultAdd =
  T.add (SProxy :: SProxy T.Five) (SProxy :: SProxy T.Two)

resultAdd2 :: SProxy "............"
resultAdd2 =
  T.add (SProxy :: SProxy T.Five) (SProxy :: SProxy T.Seven)

-- resultSub :: SProxy ".."
resultSub :: SProxy T.Two
resultSub =
  T.sub (SProxy :: SProxy T.Ten) (SProxy :: SProxy T.Eight)

resultSub2 :: SProxy "....................................."
resultSub2 =
  T.sub (SProxy :: SProxy "...............................................") (SProxy :: SProxy T.Ten)

main :: Effect Unit
main = do
  assert $ T.reflectInt (SProxy :: SProxy T.Zero) == 0
  assert $ T.reflectInt (SProxy :: SProxy "") == 0
  assert $ T.reflectInt resultAdd == 7
  assert $ T.reflectInt resultAdd2 == 12
  assert $ T.reflectInt resultSub == 2
  assert $ T.reflectInt resultSub2 == 37
