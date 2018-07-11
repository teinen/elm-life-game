module LifeGame exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)



-- STRUCTURE
type CellState
    = Living
    | Dead

type alias Tick =
    Int



-- MODEL



