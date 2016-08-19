# sonarqubeEx
Automated Sonarqube Execution from Github Reps with a Yesod App 

## Install The Software

### Install homebrew (On Mac)
Homebrew is a package manager for Mac OS X. You probably already have it. If you don't, get it as you will need it to install most other packages on Mac OS X.

### Install SonarQube
For SonarQube Server, [download](http://www.sonarqube.org/downloads/)

For Scanner, [download](http://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner)

And place them in your home folder.

You can edit your home folder, SonarQube server and scanner folder, your Sudo Password in ```MySonarEx.hs``` file.

### Install MySql
MySql database will be used by SonarQube.
```bash
$ brew install mysql
```

### Install Stack
```bash
$ brew install haskell-stack
```

### Install Yesod Command Line Tools
```bash
$ stack build yesod-bin cabal-install --install-ghc
```

### Compile Project
```bash
$ stack build
```

### Run Yesod App
```bash
$ stack exec -- devnostics
```

### Ready To Go
Now Yesod App is available at ```http://localhost:3000/```

For usage, go to [USAGE.md] (https://github.com/onatbuyukakkus/sonarqubeEx/blob/master/USAGE.md)



