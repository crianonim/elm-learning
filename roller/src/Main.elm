module Main exposing (main)

import Browser
import Dict
import Html exposing (Attribute, Html, a, button, div, h1, hr, img, input, p, pre, text)
import Html.Attributes exposing (selected, src, value)
import Html.Events exposing (onClick, onInput)
import Platform.Cmd exposing (Cmd)
import Random



main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { die=1 }
    , Random.generate NewDie (Random.int 1 6)
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Roll ->
            ( model, Random.generate NewDie (Random.int 1 6) )
        NewDie x -> ( {model|die=x}, Cmd.none)


type alias Model =
    {die:Int}


type Msg
    = Roll
    | NewDie Int


-- SUBSCRIPTIONS



subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div [] [text (String.fromInt model.die)]
