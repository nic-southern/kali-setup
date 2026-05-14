# Nic's Kali aliases.
# Installed as ~/.kali_aliases and sourced by bash and zsh.

# Navigation and listing.
alias ..='cd ..'
alias ...='cd ../..'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias c='clear'
alias path='echo "$PATH" | tr ":" "\n"'

# tmux.
alias t='tmux new-session -A -s main'
alias ta='tmux attach -t'
alias tls='tmux list-sessions'
alias tn='tmux new-session -s'
alias tk='tmux kill-session -t'
alias tr='tmux source-file ~/.tmux.conf'

# System updates.
alias update='sudo apt update && sudo apt upgrade -y'
alias install='sudo apt install'
alias search='apt search'

# Networking.
alias myip='ip -brief address'
alias routes='ip route'
alias ports='ss -tulpn'
alias listen='sudo lsof -i -P -n | grep LISTEN'
alias serve='python3 -m http.server'

# Common Kali workflows.
alias nmap-quick='nmap -T4 -F'
alias nmap-full='nmap -p- --min-rate 5000'
alias nmap-scripts='nmap -sC -sV'
alias linpeas='curl -L https://github.com/peass-ng/PEASS-ng/releases/latest/download/linpeas.sh -o linpeas.sh && chmod +x linpeas.sh'
alias les='curl -L https://raw.githubusercontent.com/mzet-/linux-exploit-suggester/master/linux-exploit-suggester.sh -o les.sh && chmod +x les.sh'

# Clipboard helpers.
alias clip='xclip -selection clipboard'
alias copy='xclip -selection clipboard'
alias paste='xclip -selection clipboard -out'
