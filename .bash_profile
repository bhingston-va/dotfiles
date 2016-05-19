#this is to set up a new bash rc file

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

#export SvnRepos=~/214asn3/svn_repository;
#export SvnURL=file://$SvnRepos;
export EDITOR=vim
export SCPSSH="scp bvh895@tuxworld.usask.ca:/student/bvh895/"
export PS1="\[\e[31m\]\`nonzero_return\`\[\e[m\]\[\e[0;32m\]\A\[\e[m\] \h:\[\e[0;36m\]\W\[\e[m\]\[\e[32m\]\`parse_git_branch\`\[\e[m\]$ "
#export SvnPrj=$SvnURL/time_calc;

# run tmux
if [[ -z "$TMUX" ]]; then
	tmux
fi

echo "hello Benj, welcome to the Matrix"

#===================
# Personnal Aliases
#===================
alias ls="ls -pG"
alias sshusask="ssh bvh895@tuxworld.usask.ca"




