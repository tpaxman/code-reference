`gitconfig`
===========
```
[log]
  date = relative

[format]
  #pretty = format:%h %Cblue%ad%Creset %ae %Cgreen%s%Creset
  #pretty = format:%C(auto,yellow)%h%C(auto,magenta)% G? %C(auto,blue)%>(12,trunc)%ad %C(auto,green)%<(7,trunc)%aN%C(auto,reset)%s%C(auto,red)% gD% D
   pretty = format:%C(auto,yellow bold)%h%C(auto, white)% G? %C(auto,blue)%>(12,trunc)%ad %C(auto,green)%<(9,trunc)%aN%C(auto,white) %s% C(auto,red reverse)%gD%D
   
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
