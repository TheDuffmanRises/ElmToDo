module Main exposing (Entry, Model, Msg(..), init, main, subscriptions, update, view)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.Lazy exposing (lazy, lazy2)



--https://guide.elm-lang.org/architecture/text_fields.html
--https://github.com/evancz/elm-todomvc/blob/master/src/Main.elm
-- MAIN


main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- MODEL


type alias Model =
    { entries : List Entry
    , field : String
    }


type alias Entry =
    { description : String
    , completed : Bool
    }


newEntry : String -> Entry
newEntry desc =
    { description = desc
    , completed = False
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( Model
    , Cmd.none
    )



-- UPDATE


type Msg
    = Input
    | AddToDo
    | NoOp
    | UpdateField String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Input ->
            ( model
            , Cmd.none
            )

        AddToDo ->
            ( { model
                | field = ""
                , entries =
                    if String.isEmpty model.field then
                        model.entries
                    else
                        model.entries ++ [ newEntry model.field ]
            }
            , Cmd.none
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ lazy viewInput model.field
        , lazy viewEntries model.entries
        ]


viewInput : String -> Html Msg
viewInput task =
    header
        [ class "header" ]
        [ h1 [] [ text "todos"]
        , input
            [ class "new-todo"
            , placeholder "What Needs To Be Done?"
            , autofocus True
            , value task
            , name "newTodo"
            , onInput UpdateField
            , onEnter AddToDo
            ]
            []
        ]


viewEntries : String -> List Entry -> Html Msg
viewEntries entries =
    List.map viewEntries