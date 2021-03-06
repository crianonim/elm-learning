# elm-learning

## Creating a new project

- `npm init`
- `npm install elm`
- add `"elm": "elm"` to scripts in `package.json`
- `npm run elm init`
- create a `src/Main.elm` ie:
```elm
module Main exposing (main)

import Browser
import Dict
import Html exposing (Attribute, Html, a, button, div, h1, hr, img, input, p, pre, text)
import Html.Attributes exposing (selected, src, value)
import Html.Events exposing (onClick, onInput)
import Platform.Cmd exposing (Cmd)


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
    ( {}
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        _ ->
            ( model, Cmd.none )


type alias Model =
    {}


type Msg
    = Noop


-- SUBSCRIPTIONS



subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div [] []
```