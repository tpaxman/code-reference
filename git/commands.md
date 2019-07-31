# Basic Commands

## add, commit
```
git add -A
git commit -m '___'
```

## initializing a repo
```
git init
git add .
git commit -m "abc"
git remote add origin <remote_repository_url>
git push -u origin master
```

## delete branch
```
git push -d <remote_name> <branch_name>
git branch -d <branch_name>
```


# File Tracking

## remove files from git tracking
```
# Best way:
git update-index --assume-unchanged <file>

# Other ways:
git rm --cached <file>
git rm -r --cached <folder>
```
(https://stackoverflow.com/questions/1274057/how-to-make-git-forget-about-a-file-that-was-tracked-but-is-now-in-gitignore)

# Add

## add only modified files
```
git add -u (is equivalent to git add --update)
```
https://stackoverflow.com/questions/572549/difference-between-git-add-a-and-git-add

# Commits

## unstage files
```
# unstage one file
$ git reset HEAD file
# unstage everything
$ git reset HEAD .
```
https://clubmate.fi/git-removing-files-from-the-staging-area-and-the-tree/

# Diffs

## general reference
https://git-scm.com/docs/git-diff

## diff between branches
```
# Two branches, same file:
git diff branchA branchB -- file.py
git diff branchB file.py  (if you are in branchA)

# Two branches, two files:
git diff develop:foo.txt master:bar.txt

# Two folders:
git diff branchA branchB -- folder

# Compact summary of difference between a folder in current branch and another branch:
git diff --compact-summary branchB -- folder
```
(https://stackoverflow.com/questions/38664421/how-do-i-call-git-diff-on-the-same-file-between-2-different-local-branches/)


## navigate long diffs:
```
u: go up half page
d: go down half page
G: jump to last line
h: display help
```
(https://stackoverflow.com/questions/32469204/scrolling-down-git-diff-from-mac-terminal)

# Find files

## find when file got deleted
```
git log --all --full-history -- <path-to-file>
```
https://stackoverflow.com/questions/7203515/git-how-to-find-a-deleted-file-in-the-project-commit-history



## ambiguous argument: both revision and filename:
```
# Treat as a branch name:
git diff ambiguous_name --

# Treat as a file name:
git diff -- ambiguous_name
```

## examine differences in words
```
# For CSVs:
git diff --word-diff-regex="[^[:space:],]+"
```
(https://stackoverflow.com/questions/10482773/also-use-comma-as-a-word-separator-in-diff)




