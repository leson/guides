# Git Tag CRUD

## List tag
> list all tags
```bash
git tag                 # list all tags
git tag -l '1.*'        # search mode to filter out matched tags
```
> show specify tag info
```bash
git show <tag name>
```

## Mark tag
> mark on current branch
```bash
git tag -a 1.0 -m "mark current branch version as 1.0"
```
> mark on other commit id
```bash
git tag -a 1.1 <commit id>
```

## switch tag
```bash
git checkout <tag name>
```

## delete tag
> local tag
```bash
git tag -d <tag name>
```
> delete remote repository tag
```bash
git push origin :refs/tags/<tag name>
```
for example:
```bash
git push origin :refs/tags/1.1
```

## push tag to remote repository
```bash
git push origin <tag name>      # push specify tag to remote repository
git push origin --tags          # push all tags to remote repository
```

