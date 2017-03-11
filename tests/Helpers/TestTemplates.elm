module Helpers.TestTemplates exposing (..)

import Helpers.Utils exposing (..)

import Lang
import LangParser2
import LangUnparser
import OurParser2 exposing (formatError)

import Expect

testCodeTransform : (Lang.Exp -> Lang.Exp) -> String -> String -> Expect.Expectation
testCodeTransform transformer inputCode expectedOutputCode =
  case LangParser2.parseE inputCode of
    Err s ->
      Expect.fail ("can't parse: " ++ formatError s ++ "\n")

    Ok inputExp ->
      let transformedExp  = transformer inputExp in
      let transformedCode = LangUnparser.unparse transformedExp in
      Expect.equal (squish transformedCode) (squish expectedOutputCode)
