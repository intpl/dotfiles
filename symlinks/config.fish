function v;nvim $argv;end
function vim;nvim $argv;end
function vi;nvim -u NONE $argv;end
function g;git $argv;end

function zs;rails s $argv;end
function zc;rails c $argv;end
function zr;rspec $argv;end

export EDITOR='vim'

#export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_DEFAULT_COMMAND='rg --files --follow --color=never --glob "!./git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

function fish_user_key_bindings
  fzf_key_bindings
  bind \cl "clear | string replace \e\[3J '' ; fish_prompt"
end

#function fish_greeting
#  echo
#  echo " ... what else?"
#  echo
#end

function ll
  /bin/ls -lG $argv
end

function la
  /bin/ls -GA $argv
end

function l
  /bin/ls -CFG $argv
end

function cdi; cd ~/work/zapakuj-to; end

function cdiv; cdi&v; end

function cdizs; cdi&zs; end
function cdizc; cdi&zc; end
function cdizr; cdi&zr; end

function dropbox_encrypted_mount
  cryfs ~/Dropbox/encrypted_do_not_touch ~/Dropbox_encrypted
end

function mkdircd
  mkdir $argv
  cd $argv
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
  echo (set_color blue)(whoami)'@'(hostname|cut -d . -f 2)(set_color normal)
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

set -g fish_user_paths "/usr/local/opt/gnu-getopt/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/llvm/bin" $fish_user_paths

set PATH $HOME/.cargo/bin $PATH
#set -gx PATH ~/.fzf/bin $PATH
rvm default

eval (direnv hook fish)
