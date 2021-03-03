#! /bin/zsh

# script variables
local rr_node_version=10.15.1
local rr_php_version=7.4
local rr_mysql_version=5.7

# -- INSTALL HOMEBREW -- {{{
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# -- }}}

# -- INSTALL OH-MY-ZSH -- {{{
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# -- }}}

# -- cask taps -- {{{
brew tap homebrew/cask
brew tap homebrew/cask-versions
# -- }}}

# -- homebrew installations -- {{{
brew install composer
brew install coreutils
brew install hub
brew install jq
brew install mysql
brew install mysql@$rr_mysql_version
brew install ncurses
brew install nginx
brew install node
brew install php@$rr_php_version
brew install pv
brew install vim
brew install zsh

# -- cask installs -- {{{
brew install --cask slack
brew install --cask postman
brew install --cask spotify

# keepassx
brew install --cask keepassx
# version 0.4.4
brew install --cask dwihn0r-keepassx

# browsers
brew install --cask google-chrome
brew install --cask google-chrome-canary
brew install --cask firefox
brew install --cask firefox-developer-edition
# -- }}}

# -- npm installations -- {{{
npm i -g vue-cli
npm install --global yarn
# -- }}}

# -- node version manager -- {{{
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install $rr_node_version
nvm use $rr_node_version
# -- }}}

# -- valet installation -- {{{
composer global require laravel/valet
valet install
valet use php@$rr_php_version
valet domain localhost
valet restart
# -- }}}

# -- python installs -- {{{
# get pip {{{
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
# }}}
# -- }}}

mkdir -p ~/.config
