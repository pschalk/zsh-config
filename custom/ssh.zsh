#
# SSH Agent
#
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
	echo "Initializing new SSH Agent..."
	/usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
	echo "Succeeded."
	chmod 600 "${SSH_ENV}"
	. "${SSH_ENV}" > /dev/null

	# Adding keys
	ssh-add $HOME/.ssh/id_ed25519
}

# Source SSH settings

if [ -f "${SSH_ENV}" ]; then
	. "${SSH_ENV}" > /dev/null
	ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
		start_agent;
	}	
else 
	start_agent;
fi

