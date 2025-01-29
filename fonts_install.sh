fonts="SauceCodePro FiraMono"
target="$HOME/.fonts"
source="$HOME/dotfiles/.fonts"

if [ ! -d "$target" ]; then
  mkdir -p "$target"
fi

cp -r $source/* "$target"
