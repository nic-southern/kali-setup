#!/bin/bash
# Nic's Kali Linux Setup Script

# Update package list
sudo apt update
sudo apt upgrade -y

# Install essential tools
sudo apt install -y docker.io tmux git wget curl xclip xsel wl-clipboard lsof xbindkeys xdotool

# Install tmux configuration
cp tmux.conf ~/.tmux.conf

# Install Mac Command key fallback bindings for Kali desktop sessions
cp xbindkeysrc ~/.xbindkeysrc
mkdir -p ~/.config/autostart
cat > ~/.config/autostart/kali-mac-keyboard.desktop <<'EOF'
[Desktop Entry]
Type=Application
Name=Kali Mac Keyboard Bindings
Comment=Map Mac Command copy/paste to Linux terminal copy/paste when Command reaches Kali as Super
Exec=xbindkeys
X-GNOME-Autostart-enabled=true
EOF
if command -v xbindkeys >/dev/null 2>&1 && [ -n "${DISPLAY:-}" ]; then
    pkill xbindkeys 2>/dev/null || true
    xbindkeys
fi

# Install shell aliases for bash and zsh
cp aliases.sh ~/.kali_aliases
for shell_rc in ~/.bashrc ~/.zshrc; do
    touch "$shell_rc"
    if ! grep -q 'source ~/.kali_aliases' "$shell_rc"; then
        {
            echo ''
            echo '# Nic Kali aliases'
            echo '[ -f ~/.kali_aliases ] && source ~/.kali_aliases'
        } >> "$shell_rc"
    fi
done

# Install tmux plugin manager
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Source tmux configuration
tmux source-file ~/.tmux.conf 2>/dev/null || true

# Copy reverse shells to /user/share/reverse-shells
sudo mkdir -p /usr/share/reverse-shells
sudo cp -R reverse-shells/* /usr/share/reverse-shells/

# Make all files in /usr/share/reverse-shells executable
sudo chmod +x /usr/share/reverse-shells/*

# Extract rockyou.txt
if [ -f /usr/share/wordlists/rockyou.txt.gz ] && [ ! -f /usr/share/wordlists/rockyou.txt ]; then
    sudo gzip -d /usr/share/wordlists/rockyou.txt.gz
fi

# Get Linpeas binary
sudo wget https://github.com/peass-ng/PEASS-ng/releases/latest/download/linpeas.sh -O /usr/share/linpeas.sh

# Make linpeas executable
sudo chmod +x /usr/share/linpeas.sh

# Get Linux Exploit Suggester 2
sudo wget -O /usr/share/les.sh https://raw.githubusercontent.com/mzet-/linux-exploit-suggester/master/linux-exploit-suggester.sh

# Make les executable
sudo chmod +x /usr/share/les.sh

# Get Powercat
if [ ! -d /usr/share/powercat ]; then
    sudo git clone https://github.com/besimorhino/powercat.git /usr/share/powercat
fi

# Make powercat executable
sudo chmod +x /usr/share/powercat/powercat.sh

