module Tanghulu where

import Prelude

import Prim.Symbol as Symbol
import Type.Prelude (SProxy(..))

type Zero
  = ""
type One
  = "."
type Two
  = ".."
type Three
  = "..."
type Four
  = "...."
type Five
  = "....."
type Six
  = "......"
type Seven
  = "......."
type Eight
  = "........"
type Nine
  = "........."
type Ten
  = ".........."

class Add (l :: Symbol) (r :: Symbol) (o :: Symbol) | l r -> o, l o -> r, r o -> l

instance addInst ::
  ( Symbol.Append l r o
  ) => Add l r o

add :: forall l r o. Add l r o => SProxy l -> SProxy r -> SProxy o
add _ _ = SProxy

class Sub (l :: Symbol) (r :: Symbol) (o :: Symbol) | l r -> o, l o -> r, r o -> l

instance subInst ::
  ( Symbol.Append r o l
  ) => Sub l r o

sub :: forall l r o. Sub l r o => SProxy l -> SProxy r -> SProxy o
sub _ _ = SProxy

class ReflectInt (s :: Symbol) where
  reflectInt :: SProxy s -> Int

instance reflectIntZero :: ReflectInt "" where
  reflectInt _ = 0

else instance reflectIntN ::
  ( Symbol.Cons "." m n
  , ReflectInt m
  ) => ReflectInt n where
  reflectInt _ = 1 + (reflectInt (SProxy :: SProxy m))
