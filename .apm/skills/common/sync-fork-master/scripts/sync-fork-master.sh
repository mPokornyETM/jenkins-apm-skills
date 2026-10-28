#!/bin/sh
set -eu

case "$#:${1-}" in
    0:)
        dry_run=false
        ;;
    1:--dry-run)
        dry_run=true
        ;;
    *)
        echo "Usage: sh sync-fork-master.sh [--dry-run]" >&2
        exit 2
        ;;
esac

git rev-parse --git-dir > /dev/null
git remote get-url origin > /dev/null
git remote get-url fork > /dev/null

git fetch --no-tags origin refs/heads/master:refs/remotes/origin/master

if [ "$dry_run" = true ]; then
    git push --dry-run fork refs/remotes/origin/master:refs/heads/master
else
    git push fork refs/remotes/origin/master:refs/heads/master
fi