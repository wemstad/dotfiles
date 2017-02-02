autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

if (( $+commands[git] ))
then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

git_branch() {
  echo $($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

unpushed () {
  $git cherry -v @{upstream} 2>/dev/null
}

git_dirty() {
  if $(! $git status -s &> /dev/null)
  then
    echo ""
  else
    if [[ $($git status --porcelain) == "" ]]
    then
      echo " on %{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}"
    else
      echo " on %{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%}"
    fi
  fi
}

git_prompt_info () {
  ref=$($git symbolic-ref HEAD 2>/dev/null) || ref=$(git rev-parse --short HEAD)
  echo "${ref#refs/heads/}"
}

# This assumes that you always have an origin named `origin`, and that you only
# care about one specific origin. If this is not the case, you might want to use
# `$git cherry -v @{upstream}` instead.
need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo ""
  else
    echo " %{$fg_bold[yellow]%}⚠️%{$reset_color%} "
  fi
}

directory_name() {
  if [[ $(pwd) == "/" ]]
  then
    echo "%{$fg_bold[cyan]%}%1/%{$reset_color%}"
  else
    echo "%{$fg_bold[cyan]%}%1/%\/%{$reset_color%}"
  fi
}

export PROMPT=$'\n$(whoami) in $(directory_name)$(git_dirty)$(need_push)\n› '

battery_status() {
  $ZSH/bin/battery-status
}

set_prompt () {
  export RPROMPT="%{$fg_bold[cyan]%}%{$reset_color%}"
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}
