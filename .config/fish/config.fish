if status is-interactive
    # Commands to run in interactive sessions can go here

end

set -x EDITOR "nvim"

alias c="clear"

function sd
  echo "sudo shutdown now"
  sudo shutdown now
end

function rb
  echo "sudo reboot"
  sudo reboot
end


function x
  nohup $argv &
end

function fish_greeting

end

function fish_prompt
  printf '%s ❯ ' (prompt_pwd)
end
