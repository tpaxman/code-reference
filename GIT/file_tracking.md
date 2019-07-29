
Remove items from tracking
==========================

## Best way:
```
git update-index --assume-unchanged <file>
```

## Other ways:
```
git rm --cached <file>
git rm -r --cached <folder>
```
(https://stackoverflow.com/questions/1274057/how-to-make-git-forget-about-a-file-that-was-tracked-but-is-now-in-gitignore)
