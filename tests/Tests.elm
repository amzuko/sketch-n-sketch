module Tests exposing (..)

import Test exposing (..)


import SimplifyTests exposing (all)

all : Test
all =
    describe "Sample Test Suite"
        [ 
        SimplifyTests.all
        
        ]
