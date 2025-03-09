# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/dhl301105/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# bindkey '^[^?' backward-kill-word

source ~/dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(starship init zsh)"

bindkey "^[[H" beginning-of-line
# bindkey "^[[1~" beginning-of-line
bindkey "^[[F" end-of-line




r() {
  flag_s=false
  flag_n=false
  killall $1
  # Xử lý từng ký tự trong đối số bắt đầu bằng '-'
  while getopts "sn" opt; do
    case "$opt" in
    s) flag_s=true ;;
    n) flag_n=true ;;
    ?) echo "Usage: $0 [-s] [-n]" && exit 1 ;;
    esac
  done

  # Loại bỏ các tùy chọn đã xử lý để chỉ còn lại các tham số thực sự
  shift $((OPTIND - 1))

  if [ $flag_n = true ] && [ $flag_s = true ]; then
    nohup $1 > /dev/null 2>&1 &
  elif [ $flag_n = true ]; then
    nohup $1 &
  elif [ $flag_s = true ]; then
    $1 > /dev/null 2>&1
  else
    $1
  fi
}
