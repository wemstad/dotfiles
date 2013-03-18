# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="gls -F --color=always"
  alias l="gls -lAh --color=always"
  alias ll="gls -l --color=always"
  alias la="gls -A --color=always"
fi