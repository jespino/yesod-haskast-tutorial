{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}

import Yesod

data Widget0 = Widget0

instance Yesod Widget0

widget0 = do
    [whamlet|<h1>This is a widget |]
    toWidget [lucius| h1 {color: blue} |]
    addScriptRemote "http://code.jquery.com/jquery-1.8.1.min.js"
    toWidget [julius|
        $(function() {
            $("h1").click(function() {
                alert("You clicked on the heading.");
            });
        });
    |]


mkYesod "Widget0" [parseRoutes|
    / Home GET
    |]

getHome :: Handler Html
getHome = defaultLayout widget0

main :: IO()
main = warp 3000 Widget0
