import Browser
import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)



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
    { input : String }


init : () -> (Model, Cmd Msg)
init _ =
    ( Model ""
    , Cmd.none
    )



-- UPDATE
type Msg
    = Input
    | AddToDo



update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Input ->
            ( model
            , Cmd.none )

        AddToDo ->
            ( model
            , Cmd.none )

-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


-- VIEW
view : Model -> Html Msg
view model =
    div []
        [ input [ placeholder "To Do", value model.input ] []
        , button [ onClick AddToDo ] [ text "Add To Do" ]
        ]
