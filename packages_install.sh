sudo pacman -Syyyuu

sudo pacman -S fish git hyprland wl-clipboard python3 npm btop foot waybar hyprpaper fuzzel unzip base-devel fd rofi-wayland dust duf jq libva-nvidia-driver inotify-tools dpkg

# sudo pacman -S dunst libnotify thermald fisher

sudo pacman -S adobe-source-han-sans-cn-fonts adobe-source-han-sans-tw-fonts adobe-source-han-sans-kr-fonts noto-fonts-emoji ttf-font-awesome ttf-joypixels gnu-free-fonts

sudo pacman -S pipewire pipewire-alsa pipewire-pulse pipewire-jack wireplumber sof-firmware

systemctl --user enable --now pipewire.socket

systemctl --user enable --now pipewire-pulse.socket

systemctl --user enable --now wireplumber.service

# systemctl enable --now thermald

chsh -s /usr/bin/fish

# fisher install IlanCosman/tide@v6
