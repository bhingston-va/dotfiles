#this is to set up a new bash rc file

source $HOME/dotfiles/bin/session-sauce.plugin.zsh
export SESS_PROJECT_ROOT=$HOME/Projects
export SESS_PROJECT_ROOT=$SESS_PROJECT_ROOT":$HOME/go/src/github.com/vendasta"

export BASH_SILENCE_DEPRECATION_WARNING=1

function nonzero_return() {
	RETVAL=$?
	[ $RETVAL -ne 0 ] && echo "[$RETVAL] "
}

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo " [${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND="rg --files-with-matches --hidden '.' --glob '!.git'"
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi
# Use ~~ as the trigger sequence instead of the default **
#export FZF_COMPLETION_TRIGGER='~~'
# Options to fzf command
#export FZF_COMPLETION_OPTS='--border --info=inline'


# https://github.com/garabik/grc: To set aliases for supported commands
[[ -s "/etc/grc.sh" ]] && source /etc/grc.sh

# custom path for vendasta box
PATH=$PATH:$HOME/google-cloud-sdk/bin
PATH=$PATH:/usr/local/mysql/bin
# Add Visual Studio Code (code)
#PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin

# pyenv init instructions for pyenv shell commands
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH
export GO111MODULE=auto
export GOPRIVATE="github.com/vendasta"

export VIMINIT='source $MYVIMRC'
export MYVIMRC='~/dotfiles/vimide/.vimrc'
export EDITOR=vim
export SCPSSH="scp bvh895@tuxworld.usask.ca:/student/bvh895/"
export PS1="\[\e[31m\]\`nonzero_return\`\[\e[m\]\[\e[0;32m\]\A\[\e[m\] \h:\[\e[0;36m\]\W\[\e[m\]\[\e[32m\]\`parse_git_branch\`\[\e[m\]\n\[\e[31m\]♥\[\e[m\] "

#export SALES_SSL_ROOT=$HOME/Projects/keys/sales-psql
## TODO: only set if it is unset
#if [ -z "$SALES_PASSWD" ]
#then
#	echo "setting sales password for psql"
#	export SALES_PASSWD=$(kubectl -n sales-demo get secret postgresql-user -o jsonpath="{.data.password}" | base64 --decode);
#	echo "sales psql password set"
#fi

# for galaxy OOM javascript heap errors
export NODE_OPTIONS=--max_old_space_size=12000
#export SvnPrj=$SvnURL/time_calc;

# run tmux at start of each window
#if [[ -z "$TMUX" ]]; then
#	tmux
#fi

echo "hello Benj, welcome to the Matrix"

#===================
# Personnal Aliases
#===================
alias go="grc go"
alias ls="ls -pG"
alias hs="history | grep"
alias sshusask="ssh bvh895@tuxworld.usask.ca"
alias gc="gcloud"
alias bashrc="~/.bash_profile"
alias vim='command nvim' vio='command vim'
eval $(thefuck --alias)
# You can use whatever you want as an alias, like for Mondays:
eval $(thefuck --alias fuck)

#===================
# Vendasta Aliases
#===================
#alias invfuck="inv pylint -f pylint_test -f test"

alias rmap="repository-mapper"

invfuck() {
	if [ $# -eq 0 ]; then
		inv pylint -f
		inv pylint_test -f
		inv test
	fi
}

lintit() {
	npx nx affected:lint --base=origin/master --parallel
}

testit() {
	npx nx affected:test --base=origin/master --ci --maxWorkers=4 --parallel --silent
}

fuckit() {
	npx nx affected:lint --base=origin/master --parallel
	npx nx affected:test --base=origin/master --ci --maxWorkers=4 --parallel --silent
	npm run affected:lint:styles
	npx nx affected:build --base=origin/master --with-deps --prod --parallel --maxParallel=5
}

# Get current weather, with option of giving town as arg
#alias weather="curl wttr.in"
weather() {
	if [ $# -eq 0 ]; then
		curl wttr.in
	else
		curl wttr.in/~$1
	fi
}

mkpdf() {
	if [ $# -eq 1 ]; then
		filename=$1
		pdflatex $filename
		open "${filename%.*}.pdf"
	fi
}

chrome-beta() {
	/Applications/Google\ Chrome\ Beta.app/Contents/MacOS/Google\ Chrome\ Beta --auto-open-devtools-for-tabs
}

export PATH=$PATH":$HOME/bin"

export PATH="$HOME/.cargo/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="usr/local/sbin:$PATH"

if type nvm &> /dev/null; then
  nvm alias default 20 &> /dev/null
  nvm use default &> /dev/null
  echo "nvm using default"
else
  echo "nvm not using default"
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

