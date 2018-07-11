module LifeGame exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)



-- Cell
type Cell
    = Living
    | Dead



-- LifeGame
type alias LifeGame =
    { width : Int
    , height : Int
    , board : List (List Cell)
    }

initialBoard : Int -> Int -> LifeGame
initialBoard w h =
    { width = w
    , height = h
    , board = List.repeat w (List.repeat h Dead)
    }


-- Model
type alias Model =
    { generation : Int
    , tick : Int
    , stopped : Bool
    , lifegame : LifeGame
    }

init : Model
init =
    { generation = 0
    , tick = 4
    , stopped = True
    , lifegame = initialBoard 50 50
    }



-- Messages
type Msg
    = NoOp
    | InitializeLifeGame LifeGame
    | NextGeneration
    | ToggleStopped
    | SetTick Int
    | Initialize



-- Update
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        InitializeLifeGame lifegame ->
            ( model, Cmd.none )

        NextGeneration ->
            ( model, Cmd.none )

        ToggleStopped ->
            ( model, Cmd.none )

        SetTick tick ->
            ( model, Cmd.none )

        Initialize ->
            ( model, Cmd.none )



-- Subscriptions
subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- View

view : Model -> Html Msg
view model =
    div []
        [ viewBoard model.lifegame
        , viewControl model
        , viewStatus model
        ]

viewBoard : LifeGame -> Html Msg
viewBoard lifegame =
    div []
        [ text "Board" ]


viewControl : Model -> Html Msg
viewControl model =
    div []
        [ initializeButton
        , stepGenButton model.stopped
        , toggleStoppedButton model.stopped
        ]

viewStatus : Model -> Html Msg
viewStatus model =
    div []
        [ text <| "Gen: " ++ (toString model.generation)
        , text <| "  "
        , text <| "Tick: " ++ (toString model.tick)
        ]


-- View components
initializeButton : Html Msg
initializeButton =
    button [ onClick Initialize ] [ text "Initialize" ]


stepGenButton : Bool -> Html Msg
stepGenButton stopped =
    button [ onClick NextGeneration, not stopped |> disabled ]
        [ text "Step 1 Gen" ]


toggleStoppedButton : Bool -> Html Msg
toggleStoppedButton stopped =
    button [ onClick ToggleStopped ]
        [ text <|
            if stopped then
                "Stop"
            else
                "Restart"
        ]



-- Main
main : Program Never Model Msg
main =
    Html.program
        { init = init ! []
        , view = view
        , update = update
        , subscriptions = subscriptions
        }