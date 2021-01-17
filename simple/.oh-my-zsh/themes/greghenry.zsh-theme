#!/usr/bin/env/ zsh

# functions
spectrum() {
    echo "%{$FG[$1]%}"
}

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  # Checks if working tree is dirty
  local STATUS=''
  local FLAGS
  FLAGS=('--porcelain')
  if [[ "$(command git config --get oh-my-zsh.hide-dirty)" != "1" ]]; then
    if [[ $POST_1_7_2_GIT -gt 0 ]]; then
      FLAGS+='--ignore-submodules=dirty'
    fi
    if [[ "$DISABLE_UNTRACKED_FILES_DIRTY" == "true" ]]; then
      FLAGS+='--untracked-files=no'
    fi
    STATUS=$(command git status ${FLAGS} 2> /dev/null | tail -n1)
  fi

  if [[ -n $STATUS ]]; then
    GIT_PROMPT_COLOR="$ZSH_THEME_GIT_PROMPT_DIRTY"
  else
    GIT_PROMPT_COLOR="$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi

  echo "$GIT_PROMPT_COLOR$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# colors
NC="%{$reset_color%}"
USER_COLOR="242"
HOSTNAME_COLOR="242"
USER_AND_HOSTNAME_SEPARATOR_COLOR="239"
TIME_COLOR="242"

# variables
USER_VAR="%n"
HOSTNAME_VAR="%m"
USER_AND_HOSTNAME_SEPARATOR_VAR="@"

# variables colored
USER="$(spectrum $USER_COLOR)$USER_VAR"
HOSTNAME="$(spectrum $HOSTNAME_COLOR)$HOSTNAME_VAR"
USER_AND_HOSTNAME_SEPARATOR="$(spectrum $USER_AND_HOSTNAME_SEPARATOR_COLOR)$USER_AND_HOSTNAME_SEPARATOR_VAR"

# groups of colored variables
USER_AND_HOST="$USER$USER_AND_HOSTNAME_SEPARATOR$HOSTNAME"
RET_STATUS="%B%(?:%F{green}›:%F{red}›)%b%f"
DIRECTORY="%B%F{cyan}%2c%b "
TIME="$(spectrum $TIME_COLOR)%*"

# final theme
ZSH_THEME_GIT_PROMPT_PREFIX="%B "
ZSH_THEME_GIT_PROMPT_SUFFIX="%b$NC "
ZSH_THEME_GIT_PROMPT_DIRTY="%F{red}"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{green}"

PROMPT='$DIRECTORY$(git_prompt_info)$RET_STATUS '
RPROMPT="$TIME $USER_AND_HOST$NC"
