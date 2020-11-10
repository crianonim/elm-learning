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
    ( { result = 1, count=3 , dice=[1]}
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Roll ->
            ( model, Random.generate NewDie (Random.list model.count (Random.int 1 6)) )

        NewDie x ->
            ( { model | result = List.foldl (+) 0 x }, Cmd.none )
        ChangeCount s->
            ( {model | count = Maybe.withDefault 1 (String.toInt s)},Cmd.none)


type alias Model =
    {  result: Int, count:Int, dice:List Int}


type Msg
    = Roll
    | NewDie (List Int)
    | ChangeCount String




-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div [] [
            button [onClick Roll] [text "Roll"]
            , input [onInput ChangeCount
            ,value (String.fromInt model.count)] []
            
        ]
        , p [] [ text (String.fromInt model.result) ]
        ]
