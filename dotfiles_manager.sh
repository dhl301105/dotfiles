#!/bin/sh

config="$HOME/.config"
dotfiles="$HOME/dotfiles"
git_push="$dotfiles/git_push.sh"
folders=""
folders_1="waybar nvim hypr foot fontconfig rofi fuzzel sxhkd alacritty bspwm polybar"

# Kiểm tra nếu không có tham số -> push git
if [ $# -eq 0 ]; then
  sh "$git_push"
  exit 1
fi

# Khởi tạo biến
flag_r=false

# Xử lý từng ký tự trong đối số bắt đầu bằng '-'
while getopts "ra" opt; do
  case "$opt" in
  r) flag_r=true ;;
  a) folders="$folders_1" ;;
  ?) echo "Usage: $0 [-r] [-a] [folder1 folder2 ...]" && exit 1 ;;
  esac
done

# Loại bỏ các tùy chọn đã xử lý để chỉ còn lại các tham số thực sự
shift $((OPTIND - 1))

# Nếu người dùng nhập thêm thư mục, nối thêm vào `folders`
folders="$folders $@"

# Tạo thư mục nếu chưa tồn tại
if [ ! -d "$dotfiles/.config" ]; then
  mkdir -p "$dotfiles/.config"
fi

# Lặp qua từng thư mục trong danh sách
for folder in $folders; do
  if [ "$flag_r" = true ] && [ -d "$dotfiles/.config/$folder" ]; then
    rm -rf "$dotfiles/.config/$folder"
  fi
  if [ -d "$config/$folder" ]; then
    cp -r "$config/$folder" "$dotfiles/.config"
  else
    echo "⚠️  Warning: Thư mục $config/$folder không tồn tại."
  fi
done

# Push lên Git
sh "$git_push"
