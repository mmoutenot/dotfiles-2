set -gx ANDROID_HOME /Users/marsh/Library/Android/sdk
set -gx PATH $PATH $ANDROID_HOME/tools $ANDROID_HOME/platform-tools

# Path to Oh My Fish install.
set -gx OMF_PATH "/Users/marsh/.local/share/omf"

set -gx PATH "/usr/local/bin" $PATH
set -gx PATH "/usr/local/lib" $PATH
set -x LSCOLORS gxfxbEaEBxxEhEhBaDaCaD
set -x GITHUB_TOKEN 74dde05ac191352a247b73536da44599120040b3
set -x REACT_EDITOR nvim

set -x FZF_DEFAULT_COMMAND 'ag -g ""'

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish
source ~/.aliases

eval (python -m virtualfish)
eval (docker-machine env default)

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

status --is-interactive; and . (rbenv init -|psub)
rbenv rehash >/dev/null ^&1

# NVM
bass source ~/.nvm/nvm.sh --no-use ';' nvm > /dev/null

# rbenv
status --is-interactive; and . (rbenv init -|psub)
