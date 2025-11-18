export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export JANK_SRC=/home/saket/Documents/oss/jank

export EDITOR=nvim

export PATH="$HOME/development/flutter/bin:$HOME/Android/Sdk/platform-tools/adb:$HOME/bin:$PATH"

export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable

alias mux=tmuxinator
alias cat=bat
. "$HOME/.cargo/env"
