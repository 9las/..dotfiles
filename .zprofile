# Autostart X at login (see https://wiki.archlinux.org/title/Xinit#Autostart_X_at_login)
# stdout and stderror output from Xorg session is redirected to file ~/.xorg.log
# (see https://wiki.archlinux.org/title/Xorg#Session_log_redirection)
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx -- -keeptty >~/.xorg.log 2>&1
fi
