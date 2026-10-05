#!/usr/bin/env bash
#
# Make a bare `git branch` also show which worktree each branch is checked out in,
# by appending the worktree's directory name to git's normal output:
#
#   * main  [my-repo]
#   + feature/login  [login-wt]
#     old-branch
#
# Any other `git` invocation (including `git branch <args>`) is passed through untouched.

git() {
	if [[ $# -eq 1 && $1 == branch ]]; then
		local is_tty=false color
		[[ -t 1 ]] && is_tty=true
		color=$(command git config --get-colorbool color.branch "$is_tty")
		[[ $color == true ]] && color=always || color=never

		command git branch --color="$color" | awk -F'\t' '
			NR == FNR { if ($2 != "") { n = split($2, p, "/"); wt[$1] = p[n] } next }
			{
				name = $0
				gsub(/\033\[[0-9;]*m/, "", name)
				name = substr(name, 3)
				print (name in wt) ? $0 "  [" wt[name] "]" : $0
			}
		' <(command git for-each-ref refs/heads --format='%(refname:short)%09%(worktreepath)') -
		return "${PIPESTATUS[0]}"
	fi
	command git "$@"
}
