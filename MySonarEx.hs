{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ExtendedDefaultRules #-}
{-# OPTIONS_GHC -fno-warn-type-defaults #-}

module MySonarEx where

import           Control.Exception      (SomeException, handle)
import           Control.Monad
import           Data.Maybe             (fromJust)
import qualified Data.Text              as T
import           Data.String
import           Data.Char
import           Data.List.Split
import           Data.List.Utils
import           Shelly
import           System.Directory
import           System.FilePath
import           System.IO              (IOMode (..), hFileSize, withFile)
import           System.Environment
import           System.Process
import Prelude hiding (FilePath)
default (T.Text)

runSonar projectName githubLink = shelly $ do
	cd "/Users/Onat1/"
	run_ "mysql.server" ["start"]
	bash "" ["echo", "password", "|", "sudo", "-S", "/Users/Onat1/sonarqube-5.6/bin/macosx-universal-64/sonar.sh", "restart"]
	run_ "sleep" ["10"]
	mkdir (fromString $ projectName)
	cd (fromString $ projectName)
	bash "" ["git", "clone", T.pack $ githubLink]
	run_ "sleep" ["10"]
	bash_ "" ["echo", T.pack $ ("sonar.projectKey= " ++ projectName), ">>", "sonar-project.properties"]
	bash_ "" ["echo", T.pack $ ("sonar.projectName= " ++ projectName ++ " :: SonarQube Scanner"), ">>", "sonar-project.properties"]
	bash_ "" ["echo", "sonar.projectVersion=1.0",">>","sonar-project.properties"]
	bash_ "" ["echo", "sonar.sourceEncoding=UTF-8",">>","sonar-project.properties"]
	bash_ "" ["echo", "sonar.sources=.",">>","sonar-project.properties"]
	bash "" ["/Users/Onat1/sonar-scanner-2.6.1/bin/sonar-scanner"]
	run_ "sleep" ["10"]
	--run_ "sudo" ["/Users/Onat1/sonarqube-5.6/bin/macosx-universal-64/sonar.sh", "stop"]

updateSonar projectName = shelly $ do
	cd "/Users/Onat1/"
	cd (fromString $ projectName)
	bash "" ["git", "pull"]
	run_ "sleep" ["5"]
	bash "" ["/Users/Onat1/sonar-scanner-2.6.1/bin/sonar-scanner"]
	run_ "sleep" ["10"]


--main = do
--	runSonar "ETW" "https://github.com/dominozor/exiledToWild.git"
