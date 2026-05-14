# Mac keyboard bindings for interactive Kali shells.
# Parallels commonly sends Option+Arrow as ESC [ 1 ; 3 C/D. Bind those
# sequences so shells move by word instead of printing C or D.

case "$-" in
    *i*) ;;
    *) return 0 2>/dev/null || exit 0 ;;
esac

if [ -n "${ZSH_VERSION:-}" ]; then
    bindkey '\e[1;3D' backward-word
    bindkey '\e[1;3C' forward-word
    bindkey '\e[1;3A' up-line-or-history
    bindkey '\e[1;3B' down-line-or-history
elif [ -n "${BASH_VERSION:-}" ]; then
    bind '"\e[1;3D": backward-word'
    bind '"\e[1;3C": forward-word'
    bind '"\e[1;3A": previous-history'
    bind '"\e[1;3B": next-history'
fi
