module Banana where

-- New Types
newtype Html = Html String

newtype Structure = Structure String

-- Types
type Title = String

-- Tag Template
el :: String -> String -> String
el tag content = "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

-- HTML Tags
html_ :: Title -> Structure -> Html
html_ title structure =
  Html
    ( el
        "html"
        ( el "head" (el "title" title)
            <> el "body" (getStructureString structure)
        )
    )

h1_ :: String -> Structure
h1_ = Structure . el "h1"

p_ :: String -> Structure
p_ = Structure . el "p"

-- Helper
render :: Html -> String
render html =
  case html of
    Html str -> str

append_ :: Structure -> Structure -> Structure
append_ (Structure first) (Structure second) =
  Structure (first <> second)

getStructureString :: Structure -> String
getStructureString struct =
  case struct of
    Structure str -> str