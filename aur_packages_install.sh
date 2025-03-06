packages="cava google-chrome visual-studio-code-bin"
# packages="ttf-noto-emoji-monochrome otf-openmoji ttf-symbola-free ttf-twemoji ttf-twemoji-color"

base="$(pwd)"

if [ ! -d "$HOME/Downloads" ]; then
  mkdir -p "$HOME/Downloads"
fi

for package in $packages; do
  cd "$HOME/Downloads"
  git clone "https://aur.archlinux.org/$package.git"
  if [[ -d "$package" ]]; then
    cd $package
    makepkg -si
  fi
done
