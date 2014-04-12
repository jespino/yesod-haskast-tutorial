{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}

import Yesod

data Hello = Hello

instance Yesod Hello

mkYesod "Hello" [parseRoutes|
    / HomeR GET
    |]

getHomeR :: Handler Html
getHomeR = defaultLayout [whamlet| Hello! |]

main :: IO()
main = warp 3000 Hello
