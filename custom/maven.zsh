alias mci='mvn clean install'
alias mci_skip='mvn clean install -DskipTests'
alias mcis=mci_skip

function mvn.archetype() {
    mvn archetype:generate -DarchetypeArtifactId=maven-archetype-archetype -DgroupId=$1 -DartifactId=$2 ;
}
function mvn.archetype.from.project() {
    mvn clean archetype:create-from-project -Dinteractive=true ;
}
function mvn.newversion() {
    mvn versions:set -DnewVersion=$1 ;
}
function mvn.deploy() {
    mvn clean install deploy ;
}

function mvn.install-file() {
  mvn org.apache.maven.plugins:maven-install-plugin:2.5:install-file \
      -Dfile=$1
}

# dynamically choose mvnw or global.
function mvn() {

  # Stop the search on this folder.
  # "/" is the highest possible, but you can go for $HOME for example
  STOP="/Users/patrickschalk"
  MVN_CMD="/opt/homebrew/Cellar/maven/current/bin/mvn"

  # ----------------------------------------------------------------------------
  # Don't edit below this line
  #
  DIR="$( pwd )"
  FILE="null"

  while [ $DIR != $STOP ]
  do
    if [ -e $DIR/mvnw ]
      then
        FILE="$DIR/mvnw"
        break
      else
        DIR="$( dirname "$DIR" )"
    fi
  done

  if [ $FILE != "null" ]
    then
      CMD=$FILE
    else
      CMD=$MVN_CMD
  fi

  # execute maven command with args
  echo "Calling $CMD $@"
  $CMD $@
}

