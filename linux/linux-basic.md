
touch test.txt


## `find`

```
find .
find . -type d
find . -type f
find . -type f -name "test1.txt"
find . -type f -name "test*"
find . -type d -name "some-dir"
find . -type f -iname "test*"      # case insensitive
find . -type f -mmin -10           # files modified in last 10 mins
find . -type f -mmin +1 -mmin -5   # files modified more than 1 min ago, less than 5 mins ago
find . -empty   # get empty files
find . -size +5M   # megabytes
find . -size +5k   
find . -size +5G


- size # takes M k or G 

-mtime # days
-mmin
-cmin, ctime # change minutes or days
-amin, atime # access minutes or days

```


