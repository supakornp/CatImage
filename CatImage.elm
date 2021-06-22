module CatImage exposing (..)

import Browser
import Html exposing (..)
import Html.Events exposing (onClick)
import Array exposing (Array)
import Html.Attributes exposing (src)


 

type alias Model = 
 { catNames : Array String
    , number : Int
 }




init : Model
init = 
    { catNames = Array.fromList ["https://png.pngtree.com/png-clipart/20190516/original/pngtree-thai-cat-cream-tabby-sitting-png-image_3652100.jpg ","https://images.all-free-download.com/images/graphiclarge/cute_cat_02_hq_pictures_168994.jpg"]
    ,number = 0 
    } 





type Msg
     = ClickNamecat 







update : Msg  -> Model -> Model
update  msg model = 
    case msg of
        ClickNamecat -> 
             { model  | 
                number =  
                        if model.number + 1 >= Array.length model.catNames then
                            0

                        else
                            model.number + 1                    
       
            }

    

view :  Model -> Html Msg
view model = 
    

    div[] 
    [ 
       div[] 
        [ img [(src ( Array.get model.number model.catNames |> Maybe.withDefault " No Cat Found"))][]]
     , button  [onClick ClickNamecat] [text "Next Cat"]
     ]



main =
    Browser.sandbox {
        init = init , update = update ,view = view 
    }



