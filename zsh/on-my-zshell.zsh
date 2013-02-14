# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="blinks"

# Haven't added support for themes yet
#source "$ZSH/themes/$ZSH_THEME.zsh-theme"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="false"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(autojump git brew osx Forklift gem bundler ruby rails rails3 sublime cp)

# Not needed any more.
#source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# export PATH=/usr/local/bin:$PATH:/bin:/usr/sbin:/sbin:/usr/bin:/usr/texbin:

# Gem
# export PATH=$PATH:$HOME/.rvm/bin:/usr/local/Cellar/ruby/1.9.3-p374/bin


# AutoJump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

