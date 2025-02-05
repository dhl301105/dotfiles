config="$HOME/.config"
dotfiles="$HOME/dotfiles"
git_push="$dotfiles/git_push.sh"

# Khởi tạo biến
flag_r=false

# Xử lý từng ký tự trong đối số bắt đầu bằng '-'
while getopts "rh" opt; do
  case "$opt" in
  r) flag_r=true ;;
  h) echo "Usage: $0 [-r]" && exit 1 ;;
  esac
done

# Loại bỏ các tùy chọn đã xử lý để chỉ còn lại các tham số thực sự
shift $((OPTIND - 1))

if [[ ! -d "$dotfiles/.config" ]]; then
  mkdir -p "$dotfiles/.config"
fi

for folder in $@; do
  if [ "$flag_r" == "true" ]; then
    rm -rf "$dotfiles/.config/$folder"
  fi
  if [ -d "$config/$folder" ]; then
    cp -r "$config/$folder" "$dotfiles/.config"
    sh "$git_push"
  fi
done
