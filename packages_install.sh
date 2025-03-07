if [ -f /etc/arch-release ]; then
  OS="arch"

  echo "Detected OS: $OS"

  sudo pacman -Syyyuu

  # sudo pacman -S fish git hyprland wl-clipboard python3 npm btop foot waybar hyprpaper fuzzel unzip base-devel fd rofi-wayland dust duf jq libva-nvidia-driver inotify-tools dpkg firefox fcitx5-im fcitx5-gtk fcitx5-unikey fcitx5-qt kwindowsystem

  sudo pacman -S fish git i3 xclip python3 npm btop alacritty polybar feh rofi unzip base-devel fd dust duf jq libva-nvidia-driver inotify-tools dpkg firefox ibus ibus-unikey kwindowsystem

  # sudo pacman -S dunst libnotify thermald fisher

  sudo pacman -S adobe-source-han-sans-cn-fonts adobe-source-han-sans-tw-fonts adobe-source-han-sans-kr-fonts noto-fonts-emoji ttf-font-awesome ttf-joypixels gnu-free-fonts

  sudo pacman -S pipewire pipewire-alsa pipewire-pulse pipewire-jack wireplumber sof-firmware

  systemctl --user enable --now pipewire.socket

  systemctl --user enable --now pipewire-pulse.socket

  systemctl --user enable --now wireplumber.service

  # systemctl enable --now thermald

  chsh -s /usr/bin/fish

# fisher install IlanCosman/tide@v6
elif [ -f /etc/debian_version ]; then
  OS="debian"
  echo "Detected OS: $OS"

elif [ -f /etc/fedora-release ]; then
  OS="fedora"
  echo "Detected OS: $OS"

  sudo dnf install --skip-unavailable fish git hyprland wl-clipboard python3 npm nodejs foot waybar hyprpaper unzip fd rofi-wayland dust duf jq

  chsh -s /usr/bin/fish
else
  echo "Unsupported OS"
  exit 1
fi
