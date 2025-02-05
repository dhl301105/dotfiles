config="$HOME/.config"
dotfiles="$HOME/dotfiles"
git_push="$dotfiles/git_push.sh"

confirm_and_remove() {
  local folder="$1"

  # Kiểm tra nếu thư mục không tồn tại
  if [ ! -d "$folder" ]; then
    echo "❌ Thư mục '$folder' không tồn tại!"
    return 1
  fi

  # Hỏi người dùng xác nhận
  read -p "⚠️  Bạn có chắc muốn xóa '$folder'? (y/N): " confirm

  # Kiểm tra nếu nhập 'y' hoặc 'Y'
  if [[ "$confirm" =~ ^[Yy]$ ]]; then
    rm -rf "$folder"
    echo "✅ Đã xóa '$folder'"
  else
    echo "❌ Hủy xóa thư mục."
  fi
}

# Kiểm tra cờ -r
if [ "$1" == "-r" ]; then
  remove=true
  exit 1
fi

for folder in $@; do
  if [ "$remove" == "true" ]; then
    rm -rf "$dotfiles/.config/$folder"
  fi
  if [ -d "$config/$folder" ]; then
    cp -r "$config/$folder" "$dotfiles/.config"
    sh "$git_push"
  fi
done
