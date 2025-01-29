base="$(pwd)"
cd "$HOME/dotfiles"
git add .
git commit -m "first commit"
git branch -M main
git push -u origin main
cd "$base"
