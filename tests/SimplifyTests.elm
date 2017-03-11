module SimplifyTests exposing (..)

import Test exposing (..)
import Expect

import LangTransform

import Helpers.TestTemplates exposing (..)

testSimplification inputCode expectedSimplification =
  Helpers.TestTemplates.testCodeTransform
    LangTransform.simplify
    inputCode
    expectedSimplification


testNoSimplification inputCode =
  testSimplification inputCode inputCode


all : Test
all = 
    describe "Simplification of little programs"
        [
            test "Unused Simple assignment" <|
                \() ->
                    testSimplification   "(let dead 6 'body')"   "'body'"
        ]