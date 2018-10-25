# collection some usage 

## cherry pick some commit to current branch 
```bash
git cherry-pick <commit-id-1> [commit-id-2] [...]
```

## remove local stale branch
```bash
git remote show origin      # show the stale branch on local
git remote prune origin     # delete stale branchs
```