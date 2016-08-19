module Handler.PostNew where

import Import
import Yesod.Form.Bootstrap3
import Text.Markdown (Markdown)
import Yesod.Text.Markdown
import MySonarEx
import qualified Data.Text as T
default (T.Text)

---data Post = Post
---	{ projectName :: Text
---	, githubLink :: Text
---	}

postForm :: AForm Handler Post
postForm = Post
		<$> areq textField (bfs ("Project Name" :: Text)) Nothing
		<*> areq textField (bfs ("GitHub Link" :: Text)) Nothing

getPostNewR :: Handler Html
getPostNewR = do
	(widget, enctype) <- generateFormPost $ renderBootstrap3 BootstrapBasicForm postForm
	defaultLayout $ do
		$(widgetFile "posts/new")

postPostNewR :: Handler Html
postPostNewR = do
	((res, widget), enctype) <- runFormPost $ renderBootstrap3 BootstrapBasicForm postForm
	case res of
		FormSuccess post -> do
			postId <- runDB $ insert post
			runSonar (unpack  ((postProjectName post))) (unpack  ((postGithubLink post)))
			redirect $ RedirectR --redirect to sonar host for now
		_ -> defaultLayout $(widgetFile "posts/new")