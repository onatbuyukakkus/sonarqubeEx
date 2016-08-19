module Handler.Redirect where

import Import
import Yesod.Form.Bootstrap3
import Text.Markdown (Markdown)
import Yesod.Text.Markdown

getRedirectR :: Handler Html
getRedirectR = do
    defaultLayout $ do
        $(widgetFile "/redirect")