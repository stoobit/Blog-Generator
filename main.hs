-- Modules
module Main where

import Banana

main :: IO ()
main = do
  let content = render html
  writeFile "index.html" content

html :: Html
html =
  html_
    "stoobit"
    ( append_
        (h1_ "stoobit")
        (p_ "This is my first blog post.")
    )