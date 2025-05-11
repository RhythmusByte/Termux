#!/bin/bash
# Git Sync by RhythmusByte
# GitHub - RhythmusByte

color() {
    echo -e "\n\e[$1m$2\e[0m\n"
}

width=$(tput cols)

echo
figlet -c "Git Sync" | lolcat
echo

subtitle="by RhythmusByte"
printf "\n%*s\n\n" $(( (width + ${#subtitle}) / 2 )) "$subtitle" | lolcat

echo
git status
echo

branch=$(git branch --show-current)
color 35 "On branch: $branch"

color 36 "Stage all changes? (y = all / n = pick files): \c"
read -r stage_all

if [[ "$stage_all" =~ ^[Yy]$ ]]; then
    echo
    git add . && color 32 "✔ Added all changes"
else
    mapfile -t unstaged < <(
        git diff --name-only &&
        git ls-files --others --exclude-standard
    )

    if [ ${#unstaged[@]} -eq 0 ]; then
        color 33 "No unstaged changes to add."
    else
        PS3=$'\e[36mSelect a file to stage (0 to finish): \e[0m'
        echo
        while true; do
            select f in "${unstaged[@]}"; do
                if [[ "$REPLY" == "0" ]]; then
                    break 2
                elif [[ -n "$f" ]]; then
                    echo
                    git add "$f" && color 32 "✔ Staged $f"
                    break
                else
                    echo
                    echo "Invalid choice."
                    break
                fi
            done
        done
    fi
fi

echo
git status
echo

mapfile -t staged < <(git diff --name-only --cached)
if [ ${#staged[@]} -gt 0 ]; then
    color 33 "Unstage files? (y/n): \c"
    read -r unstage_choice

    if [[ "$unstage_choice" =~ ^[Yy]$ ]]; then
        PS3=$'\e[33mSelect a file to unstage (0 to finish): \e[0m'
        echo
        while true; do
            select f in "${staged[@]}"; do
                if [[ "$REPLY" == "0" ]]; then
                    break 2
                elif [[ -n "$f" ]]; then
                    echo
                    git reset "$f" && color 33 "✔ Unstaged $f"
                    break
                else
                    echo
                    echo "Invalid choice."
                    break
                fi
            done
        done
    fi
fi

echo
git status
echo

default_msg="refactor: minor changes"
color 36 "Default commit message: '$default_msg'"

while true; do
    color 36 "Enter commit message (leave blank for default): \c"
    read -r commit_msg
    commit_msg=${commit_msg:-$default_msg}

    color 36 "Use \"$commit_msg\"? (y/n): \c"
    read -r ok

    if [[ "$ok" =~ ^[Yy]$ ]]; then
        break
    fi
done

echo
git commit -m "$commit_msg" \
    && color 32 "✔ Committed: $commit_msg" \
    || { color 31 "✖ Commit failed"; exit 1; }

branch=$(git branch --show-current)
color 35 "Current branch: $branch"

color 36 "Push changes? (y/n): \c"
read -r push_choice

if [[ "$push_choice" =~ ^[Yy]$ ]]; then
    color 36 "Enter branch to push (leave blank for current): \c"
    read -r target_branch
    target_branch=${target_branch:-$branch}

    echo
    git push origin "$target_branch" \
        && color 32 "✔ Pushed to $target_branch" \
        || { color 31 "✖ Push failed"; exit 1; }
fi

color 32 "🎉 All done!"
