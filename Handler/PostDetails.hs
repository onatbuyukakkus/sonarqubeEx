module Handler.PostDetails where

import Import
import Text.Markdown (Markdown)
import Yesod.Text.Markdown
import MySonarEx
import qualified Data.Text as T
default (T.Text)

getPostDetailsR :: PostId -> Handler Html
getPostDetailsR postId = do
	post <- runDB $ get404 postId
	defaultLayout $ do
		$(widgetFile "postDetails/post")

updateP :: PostId -> Handler Html
updateP postId = do
	post <- runDB $ get404 postId
	updateSonar (unpack  ((postProjectName post)))
	redirect $ RedirectR --redirect to sonar host for now