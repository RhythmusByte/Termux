#!/usr/bin/zsh

# Fetch repo list (name only)
mapfile -t repos < <(gh repo list RhythmusByte --limit 50 --json name -q '.[].name')

# Show menu
echo "Your Repos:"
for i in "${!repos[@]}"; do
    printf "%2d) %s\n" "$((i+1))" "${repos[$i]}"
done

# Prompt user
printf 'Enter the repo number to clone: '
read -r choice

# Validate choice
if [[ "$choice" =~ ^[0-9]+$ ]] && (( choice >= 1 && choice <= ${#repos[@]} )); then
    repo_name="${repos[$((choice-1))]}"
    echo "Cloning: RhythmusByte/$repo_name ..."
    gh repo clone "RhythmusByte/$repo_name"
else
    echo "❌ Invalid choice"
    exit 1
fi
