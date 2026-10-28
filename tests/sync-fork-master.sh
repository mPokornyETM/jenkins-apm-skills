#!/bin/sh
set -eu

repository=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
helper="$repository/.apm/skills/common/sync-fork-master/scripts/sync-fork-master.sh"
sh -n "$helper"
sandbox=$(mktemp -d)
cleanup() {
    cd /
    rm -rf "$sandbox"
}
trap cleanup EXIT
trap 'exit 1' HUP INT TERM
cd "$sandbox"

git init -q --bare upstream.git
git init -q --bare fork.git
git init -q -b master client
cd client
git config user.name 'Sync Test'
git config user.email sync-test@example.invalid
git config commit.gpgsign false
git config core.hooksPath /dev/null
git remote add origin ../upstream.git
git remote add fork ../fork.git
git commit -q --allow-empty -m initial
git push -q origin master
git push -q fork master
initial=$(git rev-parse HEAD)

git commit -q --allow-empty -m upstream
git push -q origin master
upstream=$(git rev-parse HEAD)
git checkout -q -b local-work "$initial"
printf '%s\n' 'local work must survive' > untracked.txt
status_before=$(git status --porcelain)

sh "$helper" --dry-run
test "$(git --git-dir=../fork.git rev-parse master)" = "$initial"
sh "$helper"
test "$(git --git-dir=../fork.git rev-parse master)" = "$upstream"
sh "$helper"
test "$(git branch --show-current)" = local-work
test "$(git rev-parse HEAD)" = "$initial"
test "$(git status --porcelain)" = "$status_before"
test "$(cat untracked.txt)" = 'local work must survive'

git commit -q --allow-empty -m fork-only
diverged=$(git rev-parse HEAD)
git push -q --force fork HEAD:master
if sh "$helper"; then
    echo 'FAIL: divergent fork was accepted' >&2
    exit 1
fi
test "$(git --git-dir=../fork.git rev-parse master)" = "$diverged"
test "$(git branch --show-current)" = local-work
test "$(git status --porcelain)" = "$status_before"

if sh "$helper" --invalid; then
    echo 'FAIL: invalid argument was accepted' >&2
    exit 1
else
    test "$?" -eq 2
fi
git remote remove fork
if sh "$helper"; then
    echo 'FAIL: missing fork remote was accepted' >&2
    exit 1
fi

echo 'PASS: syntax, dry-run, sync, idempotency, divergence, local work, arguments, remotes'