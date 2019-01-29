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
[log]
  date = relative
[format]
  #pretty = format:%h %Cblue%ad%Creset %ae %Cgreen%s%Creset
  pretty = format:%C(auto,yellow)%h%C(auto,magenta)% G? %C(auto,blue)%>(12,trunc)%ad %C(auto,green)%<(7,trunc)%aN%C(auto,reset)%s%C(auto,red)% gD% D
  
  #(Source: https://stackoverflow.com/questions/1441010/the-shortest-possible-output-from-git-log-containing-author-and-date)

[alias]
# logs
#l = log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short
l = log
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

d = diff
ds = diff --stat
dc = diff --cached
a = add
ap = add -p
aa = add .
c = commit --verbose
ca = commit -a --verbose
cm = commit -m
cam = commit -a -m
m = commit --amend --verbose

d = diff
ds = diff --stat
dc = diff --cached

s = status -s
co = checkout
cob = checkout -b
# list branches sorted by last modified
b = "!git for-each-ref --sort='-authordate' --format='%(authordate)%09%(objectname:short)%09%(refname)' refs/heads | sed -e 's-refs/heads/--'"

# list aliases
la = "!git config -l | grep alias | cut -c 7-"
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
