{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}

import Yesod
import Data.Text

data App = App

instance Yesod App

mkYesod "App" [parseRoutes|
    /#Text Home GET
    |]

getHome :: Text -> Handler Html
getHome name = defaultLayout [whamlet| <h1> Hello #{name}! |]

main :: IO()
main = warp 3000 App
