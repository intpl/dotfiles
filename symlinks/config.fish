function vi; nvim -u NONE $argv; end
function ec;emacsclient $argv;end

function em;emacs -nw $argv;end

function g;git $argv;end

function e;$EDITOR $argv; end
function v;$EDITOR $argv; end

function zs;bundle exec rails s;end
function zc;rails c;end
function zr;env RAILS_ENV=test bundle exec rspec $argv;end

function cdi;cd ~/code/pjeski; end
function cdizc;cdi;zc;end
function cdizr;cdi;zr;end
function cdizs;cdi;zs;end

function be; bundle exec $argv;end

export FZF_DEFAULT_COMMAND='fd --type f --color=never'
export FZF_ALT_C_COMMAND='fd --type d . --color=never'

export TAG_SEARCH_PROG="rg"

if set -q INSIDE_EMACS
  export TAG_CMD_FMT_STRING="emacsclient +{{.LineNumber}}:{{.ColumnNumber}} {{.Filename}}"
  export EDITOR="emacsclient"
else
  export TAG_CMD_FMT_STRING='nvim "+call cursor({{.LineNumber}}, {{.ColumnNumber}})" {{.Filename}}'
  export EDITOR="nvim"
end

rvm default

function fish_user_key_bindings
  fzf_key_bindings
  bind \cl "clear | string replace \e\[3J '' ; fish_prompt"
end

function fish_greeting;; end

function ll
  exa -lgh --git $argv
end

function la
  exa -lgah --git $argv
end

function l
  exa -a $argv
end

function lt
  exa -T $argv
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
  sudo apt full-upgrade
end

set fish_git_dirty_color red
set fish_git_not_dirty_color green

function parse_git_branch
  set -l branch (git rev-parse --abbrev-ref HEAD 2> /dev/null)
  set -l git_diff (git diff)

  if test -n "$git_diff"
    echo (set_color $fish_git_dirty_color)$branch(set_color normal)
  else
    echo (set_color $fish_git_not_dirty_color)$branch(set_color normal)
  end
end

function ruby_version
  echo (set_color cyan)(rvm-prompt | sed "s/ruby-//g")(set_color normal)
end

# fix for prompt in Emacs
function fish_title
  true
end

function fish_prompt
  set -l git_dir (git rev-parse --git-dir 2> /dev/null)
  printf '%s ' (ruby_version)
  if test -n "$git_dir"
    printf '%s%s:%s%s' (set_color $fish_color_cwd) (prompt_pwd) (parse_git_branch) (set_color normal)
  else
    printf '%s%s%s' (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
  end

  printf '%s > %s' (set_color blue) (set_color normal)
end

function fishcognito
  echo "Starting incognito session..."
  env fish_history='' fish
  echo "Exiting incognito session..."
end

# function nvm
#    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
# end

function kde_blurry_pgrep
  for WINPID in (xdotool search --pid (pgrep $argv))
    xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $WINPID
  end
end

function ifad_vpn
  sudo /home/b/code/openconnect-vjt/myvpn/run.sh
end


#nvm use default --silent
#eval (direnv hook fish)

set -gx PATH "$HOME/.cargo/bin" $PATH
set -gx PATH "$HOME/go/bin" $PATH

set -gx PATH ~/.fzf/bin $PATH
set -gx PATH ~/.local/bin $PATH

set -Ux VISUAL nvim
set -U FZF_LEGACY_KEYBINDINGS 0
