config="$HOME/.config"
dotfiles="$HOME/dotfiles"
git_push="$dotfiles/git_push.sh"

# Kiểm tra nếu không có tham số thư mục
if [ $# -eq 0 ]; then
  sh "$git_push"
  exit 1
fi

# Khởi tạo biến
flag_r=false

# Xử lý từng ký tự trong đối số bắt đầu bằng '-'
while getopts "r" opt; do
  case "$opt" in
  r) flag_r=true ;;
  ?) echo "Usage: $0 [-r]" && exit 1 ;;
  esac
done

# Loại bỏ các tùy chọn đã xử lý để chỉ còn lại các tham số thực sự
shift $((OPTIND - 1))

if [[ ! -d "$dotfiles/.config" ]]; then
  mkdir -p "$dotfiles/.config"
fi

for folder in "$@"; do
  if [ "$flag_r" == "true" ] && [ -d "$dotfiles/.config/$folder" ]; then
    rm -rf "$dotfiles/.config/$folder"
  fi
  if [ -d "$config/$folder" ]; then
    cp -r "$config/$folder" "$dotfiles/.config"
  fi
done

sh "$git_push"
