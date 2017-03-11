module Tests exposing (..)

import Test exposing (..)

import CallStackExcessionTests exposing (all)
import SimplifyTests exposing (all)

all : Test
all =
    describe "Sample Test Suite"
        [ 
            CallStackExcessionTests.all,
            SimplifyTests.all
        ]
