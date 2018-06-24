# Git Regret Medicine

## When we merge the code and status was "XXX|Merging",we can use `reset` to specially commit
```bash
git reset --hard head
```

## `checkout` rollback the untrack file.
```bash
git checkout <untracked file>
```

## `revert` revert specially version that you have pushed to remote repository
```git
git revert <commit id>	# this commit working will be revert.will not retain the working
git push <remote repository alias,such as origin and so on> <branch name,if remote bran
ch name don't same as local branch name, please mark the remote_branch_name:local_branch_name>
```
