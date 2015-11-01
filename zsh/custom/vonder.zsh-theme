# Pure
# by Sindre Sorhus
# https://github.com/sindresorhus/pure
# MIT License

# For my own and others sanity
# git:
# %b => current branch
# %a => current action (rebase/merge)
# prompt:
# %F => color dict
# %f => reset color
# %~ => current path
# %* => time
# %n => username
# %m => shortname host
# %(?..) => prompt conditional - %(condition.true.false)

# fastest possible way to check if repo is dirty
prompt_pure_git_dirty() {
    # check if it's dirty
    command git diff --quiet --ignore-submodules HEAD &>/dev/null
    # if exit code is 1 - git is dirty
    (($? == 1)) && echo '%F{red}*%f'
}

prompt_pure_preexec() {
    # shows the current dir and executed command in the title when a process is active
    print -Pn "\e]0;"
    echo -nE "$PWD:t: $2"
    print -Pn "\a"
}

prompt_git_status() {
    # check if we're in a git repo
    command git rev-parse --is-inside-work-tree &>/dev/null || return
    echo " ($vcs_info_msg_0_$(prompt_pure_git_dirty))"
}

# string length ignoring ansi escapes
prompt_pure_string_length() {
    echo ${#${(S%%)1//(\%([KF1]|)\{*\}|\%[Bbkf])}}
}

prompt_current_dir() {
    echo '%F{blue}%~%f'
}

prompt_pure_precmd() {
    # shows the full path in the title
    print -Pn '\e]0;%~\a'

    # git info
    vcs_info
    local prompt_pure_preprompt='\n$(prompt_current_dir)$(prompt_git_status)$prompt_pure_username'
    print -P $prompt_pure_preprompt

    # check async if there is anything to pull
    (( ${PURE_GIT_PULL:-0} )) && {
    # check if we're in a git repo
    command git rev-parse --is-inside-work-tree &>/dev/null &&
        # check check if there is anything to pull
    command git fetch &>/dev/null &&
        # check if there is an upstream configured for this branch
    command git rev-parse --abbrev-ref @'{u}' &>/dev/null &&
        {
            local arrows=''
            (( $(command git rev-list --right-only --count HEAD...@'{u}' 2>/dev/null) > 0 )) && arrows='⇣'
            (( $(command git rev-list --left-only --count HEAD...@'{u}' 2>/dev/null) > 0 )) && arrows+='⇡'
            print -Pn "\e7\e[A\e[1G\e[`prompt_pure_string_length $prompt_pure_preprompt`C%F{cyan}${arrows}%f\e8"
        }
    } &!
}

prompt_pure_setup() {
    export PROMPT_EOL_MARK=''
    prompt_opts=(cr subst percent)

    zmodload zsh/datetime
    autoload -Uz add-zsh-hook
    autoload -Uz vcs_info

    add-zsh-hook precmd prompt_pure_precmd
    add-zsh-hook preexec prompt_pure_preexec

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:*' use-simple true
    zstyle ':vcs_info:git*' formats '%F{yellow}%b%f'
    zstyle ':vcs_info:git*' actionformats '%F{yellow}%b|%a'

    # show username@host if logged in through SSH
    [[ "$SSH_CONNECTION" != '' ]] && prompt_pure_username=' %F{242}%n@%m%f'

    # show username@host if root, with username in white
    [[ $UID -eq 0 ]] && prompt_pure_username=' %F{white}%n%f%F{242}@%m%f'

    # prompt turns red if the previous command didn't exit with 0
    PROMPT="%(?.%F{magenta}.%F{red})${PURE_PROMPT_SYMBOL:-❯}%f "
}

prompt_pure_setup "$@"
