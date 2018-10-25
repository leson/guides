# collection some usage scenario 

## create new branch and swith to the new branch 
```bash
git checkout -b <new branch name> [relate branch name: such as origin/master] 
```

## cherry pick some commit to current branch 
```bash
git cherry-pick <commit-id-1> [commit-id-2] [...]
```

## remove local stale branch that associate remote branch
```bash
git remote show origin      # show the stale branch on local
git remote prune origin     # delete stale branchs
```

## show the changed file name only.
```bash
git diff --name-only

# more info please refer below manual
man git diff
```

## via the content search who change the file.
```bash
git log -p 

git log --pretty=format:"%h - %an, %ar : %s"
```

## 