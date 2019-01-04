alias dc='docker-compose'
alias dc.down='docker-compose down'
alias dc.up='docker-compose up'
alias dc.downup='dc.down; dc.up'

alias dc.ps="docker-compose ps"
alias dc.log="docker-compose up logs -f"
alias docker.compose.ps=dc.ps
alias docker.compose.log=dc.log

alias docker.kill='docker ps -a && docker ps -aq | xargs docker rm -f'
alias docker.rmi.dangling='docker images -f "dangling=true" -q | xargs docker rmi && docker images'
alias docker.rmi.all='docker rmi $(docker images -q)'
alias docker.rm.all.container='docker rm $(docker ps -a -q)'
alias docker.rm.dead='docker ps --filter status=dead --filter status=exited -aq | xargs docker rm -v'

function docker.compose.upandlog() {
	 docker-compose up -d $1 && docker-compose logs -f $1
}
