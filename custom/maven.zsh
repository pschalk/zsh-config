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

