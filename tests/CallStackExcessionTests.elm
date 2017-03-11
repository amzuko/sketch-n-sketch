module CallStackExcessionTests exposing (..)


import Expect
import List
import String
import Test exposing (..)

import LangParser2
import OurParser2 exposing (formatError)




testItParses : String -> Expect.Expectation
testItParses inputCode =
    case LangParser2.parseE inputCode of
        Err s ->
            Expect.fail ("can't parse: " ++ formatError s ++ "\n")
        Ok _ ->
            Expect.pass

all: Test
all = 
    describe "Parse a long little programs"
        [
            test "TestParse1" <|
                \() ->
                    testItParses "(def a 6)"
            -- This test always passes
            , test "TestParse100" <|
                \() ->
                    testItParses (String.concat (List.repeat 100 "(def a 6) \n"))
            -- This test generates the call stack size excession; commenting it out will cause the
            -- test suite to pass.
            , test "TestParse1000" <|
                \() ->
                    testItParses (String.concat (List.repeat 1000 "(def a 6) \n"))
        ]