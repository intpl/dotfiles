rvm default

function tmux
  env TERM=xterm-256color /usr/bin/tmux $argv
end

function ll
  /bin/ls --color=auto -l $argv
end

function la
  /bin/ls --color=auto -A $argv
end

function l
  /bin/ls --color=auto -CF $argv
end

function cdk
  cd ~/code/dlog/backend
end

function cdl
  cd ~/code/dlog/frontend
end

function cdm
  cd ~/code/utc-new
end

function mkdircd
  mkdir $argv
  cd $argv
end

function dropbox_encrypted_mount
  cryfs ~/Dropbox/encrypted_do_not_touch ~/Dropbox_encrypted
end

function aptgetupdateshit
  sudo apt update
  sudo apt dist-upgrade
end


set fish_git_dirty_color red
set fish_git_not_dirty_color green

function parse_git_branch
  set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
  set -l git_diff (git diff)

  if test -n "$git_diff"
    echo (set_color $fish_git_dirty_color)$branch(set_color normal)
  else
    echo (set_color $fish_git_not_dirty_color)$branch(set_color normal)
  end
end

function ruby_version
  echo (set_color cyan)(ruby --version | awk '{print $2}' | grep -ohE '[0-9]\.[0-9]\.[0-9]')(set_color normal)
end

function whoami_and_hostname
  echo (set_color red)(whoami)'@'(hostname|cut -d . -f 1)(set_color normal)
end

function fish_prompt
  set -l git_dir (git rev-parse --git-dir 2> /dev/null)
  printf '%s %s ' (whoami_and_hostname) (ruby_version)
  if test -n "$git_dir"
    printf '%s%s:%s%s' (set_color $fish_color_cwd) (prompt_pwd) (parse_git_branch) (set_color normal)
  else
    printf '%s%s%s' (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
  end

  printf '%s > %s' (set_color blue) (set_color normal)
end
