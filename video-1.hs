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
    /resource1 Resource1 GET
    /resource2 Resource2 GET
    |]

getHomeR :: Handler Html
getHomeR = defaultLayout [whamlet| <a href=@{Resource1}>Resource1 |]

getResource1 :: Handler Html
getResource1 = defaultLayout [whamlet| <a href=@{Resource2}>Resource2 |]

getResource2 :: Handler Html
getResource2 = defaultLayout [whamlet| <a href=@{HomeR}>Home |]

main :: IO()
main = warp 3000 Hello
