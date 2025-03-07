packages=""
packages_1="visual-studio-code-bin"
# packages="ttf-noto-emoji-monochrome otf-openmoji ttf-symbola-free ttf-twemoji ttf-twemoji-color"

base="$(pwd)"

if [ ! -d "$HOME/Downloads" ]; then
  mkdir -p "$HOME/Downloads"
fi

# Check if any arguments are passed to the script.
# If no arguments are passed, the condition will be true.
if [ -z "$@" ]; then
  packages=$packages_1
else
  packages=$@
fi

for package in $packages; do
  cd "$HOME/Downloads"
  git clone "https://aur.archlinux.org/$package.git"
  if [[ -d "$package" ]]; then
    cd $package
    makepkg -si
  fi
done
