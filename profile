# Load plugins
for plugin in "$(dirname $(realpath ${BASH_SOURCE[0]:-${(%):-%x}}))"/shell_plugins/*; do
	source "$plugin"
done

# Custom aliases
alias sl='ls'
alias o='xopen'
alias p='python3'
alias fd='fdfind'
alias igrep='grep -i'
alias getpid='xprop | grep -i pid | sed "s/[^0-9]//g"'
alias freeze='kill -SIGSTOP $(getpid)'
alias unfreeze='kill -SIGCONT $(getpid)'
which bat > /dev/null && alias cat='bat'
which batcat > /dev/null && alias cat='batcat'
which code > /dev/null || alias code='codium'

# Custom functions
function xopen {
	if [[ $# == 0 ]]; then xdg-open .; return; fi
	for i in "$@"; do
		xdg-open $i
	done
}
function build {
	if [[ $(basename "$(pwd)") != build ]]; then
		mkdir -p build
		cd build
	fi
	cmake .. && make -j4
}

# Environment variables
export WATCH_INTERVAL=0.1
