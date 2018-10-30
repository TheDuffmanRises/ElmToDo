port module Main exposing (Entry, Model, main, view)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

--https://guide.elm-lang.org/architecture/text_fields.html
--https://github.com/evancz/elm-todomvc/blob/master/src/Main.elm


-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { entries : List Entry
    , input : String
    }


type alias Entry =
    { description : String }

init : Model
init =
    { entries = []
    , input = ""
    }

-- UPDATE
type Msg
    =

update : Msg -> Model -> Model
update msg model =

-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ input ]
