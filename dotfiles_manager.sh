config="$HOME/.config"
dotfiles="$HOME/dotfiles"
git_push="$dotfiles/git_push.sh"
folders=""
folders_1="waybar nvim hypr foot fontconfig rofi fuzzel"

# Kiểm tra nếu không có tham số thư mục
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
  a) folders=$folders_1 ;;
  ?) echo "Usage: $0 [-r]" && exit 1 ;;
  esac
done

# Loại bỏ các tùy chọn đã xử lý để chỉ còn lại các tham số thực sự
shift $((OPTIND - 1))

if [[ ! -d "$dotfiles/.config" ]]; then
  mkdir -p "$dotfiles/.config"
fi

# If arguments are provided, the condition will be true.
# If no arguments are provided, the condition will be true.
if [ ! -z "$@" ]; then
  folders+=$@
fi

for folder in "$folders"; do
  if [ "$flag_r" == "true" ] && [ -d "$dotfiles/.config/$folder" ]; then
    rm -rf "$dotfiles/.config/$folder"
  fi
  if [ -d "$config/$folder" ]; then
    cp -r "$config/$folder" "$dotfiles/.config"
  fi
done

sh "$git_push"
