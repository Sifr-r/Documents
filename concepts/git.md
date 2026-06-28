# Git

## Essential Workflow

```bash
# Start
git init
git clone <url>

# Daily
git status
git diff                    # unstaged changes
git diff --staged           # staged changes
git add <file>
git add -p                  # interactive stage hunks
git commit -m "message"
git push origin main
git pull origin main        # fetch + merge

# Undo
git restore <file>          # discard unstaged changes
git restore --staged <file> # unstage
git commit --amend          # edit last commit message
git reset --soft HEAD~1     # undo commit, keep changes staged
git reset --hard HEAD~1     # undo commit, discard changes
git revert <commit>         # safe undo (creates new commit)
```

## Branching

```bash
git branch feature/x        # create branch
git checkout feature/x      # switch (or git switch)
git checkout -b feature/x   # create + switch
git switch -c feature/x     # modern equivalent
git merge feature/x         # merge into current branch
git branch -d feature/x     # delete (merged)
git branch -D feature/x     # force delete

# Merge strategies
git merge feature/x         # creates merge commit
git merge --squash feature/x # squash into one commit
git rebase main             # replay commits on top of main
```

## Rebase

```bash
git checkout feature/x
git rebase main             # replay feature on top of main
# Resolve conflicts, then:
git add <resolved>
git rebase --continue
git rebase --abort          # cancel rebase

# Interactive rebase (squash, reword, reorder)
git rebase -i HEAD~3        # last 3 commits
# Commands: pick, reword, squash, fixup, drop, edit

# Rebase vs Merge
# Rebase: linear history, cleaner log — use for feature branches
# Merge: preserves true history — use for public/shared branches
# NEVER rebase commits that have been pushed to shared branches!
```

## Stashing

```bash
git stash                   # save uncommitted changes
git stash save "message"    # with description
git stash list
git stash pop               # apply + drop top stash
git stash apply stash@{1}   # apply specific stash
git stash drop stash@{0}
```

## History & Log

```bash
git log --oneline --graph --all
git log -p                  # show patches
git log --author="name"
git log --grep="pattern"
git log --since="2026-01-01"
git log -S"function_name"   # search commits that changed this string
git blame <file>            # who changed each line
git show <commit>           # show commit details + diff
```

## Bisect (Find Bug-Introducing Commit)

```bash
git bisect start
git bisect bad HEAD         # current is broken
git bisect good v1.0        # known good
# Git checks out midpoint; test it:
git bisect good             # if this commit works
git bisect bad              # if this commit is broken
# Repeat until culprit found
git bisect reset            # end bisect
```

## Tags & Releases

```bash
git tag v1.0.0              # lightweight tag
git tag -a v1.0.0 -m "Release v1.0.0"  # annotated (recommended)
git push origin v1.0.0
git push origin --tags      # push all tags
git tag -d v1.0.0           # delete local
git push origin --delete v1.0.0  # delete remote
```

## Hooks

Scripts in `.git/hooks/` that run on Git events.

```bash
# Common hooks
pre-commit       # before commit — lint, format, test
commit-msg       # validate commit message format
pre-push         # before push — run tests
post-checkout    # after checkout — install deps
```

```bash
# Example pre-commit hook
#!/bin/sh
cargo fmt -- --check || exit 1
cargo clippy -- -D warnings || exit 1
```

## Common Scenarios

```bash
# Accidentally committed to wrong branch
git reset HEAD~1 --soft     # undo commit, keep changes
git stash
git checkout correct-branch
git stash pop
git commit

# Forgot a file in last commit
git add forgotten-file
git commit --amend --no-edit

# Undo a pushed commit (safe)
git revert <commit>
git push

# Find deleted file
git log --diff-filter=D --summary | grep delete
git checkout <commit>~1 -- path/to/file  # restore deleted file
```
