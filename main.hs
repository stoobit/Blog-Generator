-- Modules
module Main where

main :: IO ()
main = putStrLn (makeHTML "My page title" "My page content")

-- Create Document
makeHTML :: String -> String -> String
makeHTML title body =
  html_
    (head_ (title_ title) <> body_ body)

-- HTML Tags
html_ :: String -> String
html_ = el "html"

head_ :: String -> String
head_ = el "head"

body_ :: String -> String
body_ = el "body"

title_ :: String -> String
title_ = el "title"

-- Tag Template
el :: String -> String -> String
el tag content = "<" <> tag <> ">" <> content <> "</" <> tag <> ">"