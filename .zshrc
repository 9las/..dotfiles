### Add aliases ###

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

### Customise prompt ###

PROMPT='[%n@%m %1d]%# '

### Setup key bindings ###
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[home]="${terminfo[khome]}"
key[end]="${terminfo[kend]}"
key[insert]="${terminfo[kich1]}"
key[delete]="${terminfo[kdch1]}"
key[page_up]="${terminfo[kpp]}"
key[page_down]="${terminfo[knp]}"

# setup key accordingly
[[ -n "${key[home]}"      ]] && bindkey -- "${key[home]}"       beginning-of-line
[[ -n "${key[end]}"       ]] && bindkey -- "${key[end]}"        end-of-line
[[ -n "${key[insert]}"    ]] && bindkey -- "${key[insert]}"     overwrite-mode
[[ -n "${key[delete]}"    ]] && bindkey -- "${key[delete]}"     delete-char
[[ -n "${key[page_up]}"    ]] && bindkey -- "${key[page_up]}"     beginning-of-buffer-or-history
[[ -n "${key[page_down]}"  ]] && bindkey -- "${key[page_down]}"   end-of-buffer-or-history

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi
