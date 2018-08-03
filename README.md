# Purescript-Tanghulu

[![Build Status](https://travis-ci.org/justinwoo/purescript-tanghulu.svg?branch=master)](https://travis-ci.org/justinwoo/purescript-tanghulu)

A library for working with unlimited type-level naturals using an encoding of `.` in `Symbol`.

Like Tanghulu

![](https://i.imgur.com/9u9KuCu.png)

## Usage

```purs
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
```

See the [API Docs](https://pursuit.purescript.org/packages/purescript-tanghulu/) or the [tests](test/Main.purs) for usage.
