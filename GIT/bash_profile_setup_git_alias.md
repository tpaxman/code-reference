Setting up bash_profile aliases for Git
=======================================

(1) Open git bash
-----------------
You can do this from you start menu by just searching for ‘git bash’

(2) Run these commands
----------------------
```
cd ~/
notepad .bash_profile
```

(3) Paste the following into the notepad file and save it
---------------------------------------------------------
```
# -----------
# Git Aliases
# -----------
alias g='git'

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
	. /etc/bash_completion
fi

function_exists() {
	declare -f -F $1 > /dev/null
	return $?
}

for al in `__git_aliases`; do
	alias g$al="git $al"

	complete_func=_git_$(__git_aliased_command $al)
	function_exists $complete_fnc && __git_complete g$al $complete_func
done
```
	
(4) Find your git config file. This command should tell you right where it is.
------------------------------------------------------------------------------
(It should be located at `C:\Users\your_user_name\.gitconfig`)
```
git config --global --edit
```

(5) Using explorer or your terminal, open the .gitconfig file and paste the following:
--------------------------------------------------------------------------------------
```
[alias]
l = log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short
lg = log --graph --oneline --decorate --all
a = add
ap = add -p
aa = add .
ac = !git add -A && git commit -m
c = commit --verbose
ca = commit -a --verbose
cm = commit -m
cam = commit -a -m
m = commit --amend --verbose
#etc... (see more in the gitconfig aliases list file in this repo)
```

(6) Run the following in bash or simply close and re-open your bash terminal
----------------------------------------------------------------------------
```
source ~/.bash_profile
```

(7) Run the following to see your git aliases
---------------------------------------------
- In cmd or powershell: `git la`
- In bash you can also do: `g la`
- also works in bash: `gla`
	
(Source: http://kurtdowswell.com/software-development/git-bash-aliases/)
