# Kali tmux Hotkey Cheatsheet

This setup is tuned for a Mac keyboard running Kali in a Parallels VM.

Bottom row:

- `Control`: tmux prefix key
- `Option`: normal terminal word movement and tmux window jumps
- `Command`: mostly left alone for macOS and Parallels

In Parallels, make sure the left or right `Option` key is set to send `Alt` to the VM.
See `PARALLELS.md` for the matching VM and macOS keyboard settings.

## Prefix

The tmux prefix is:

```text
Control + Space
```

Press `Control + Space`, release both keys, then press the next key.

## Windows

| Action | Hotkey |
| --- | --- |
| New window | `Control + Space`, then `c` |
| Previous window | `Control + Space`, then `p` |
| Next window | `Control + Space`, then `n` |
| Last window | `Control + Space`, then `Space` |
| Pick from sessions/windows/panes | `Control + Space`, then `S` |
| Rename window | `Control + Space`, then `,` |
| Close window | `Control + Space`, then `X` |
| Jump to window 1-9 | `Option + 1` through `Option + 9` |

## Panes

| Action | Hotkey |
| --- | --- |
| Split left/right | `Control + Space`, then `\|` |
| Split top/bottom | `Control + Space`, then `-` |
| Split left/right, default tmux key | `Control + Space`, then `%` |
| Split top/bottom, default tmux key | `Control + Space`, then `"` |
| Move left | `Control + Option + h` or `Control + Option + Left` |
| Move down | `Control + Option + j` or `Control + Option + Down` |
| Move up | `Control + Option + k` or `Control + Option + Up` |
| Move right | `Control + Option + l` or `Control + Option + Right` |
| Resize left/right | `Control + Space`, then `H`/`L` |
| Resize up/down | `Control + Space`, then `K`/`J` |
| Close pane | `Control + Space`, then `x` |
| Zoom pane | `Control + Space`, then `z` |

Plain `Option + Left` and `Option + Right` are intentionally left for moving between words in the terminal.
If those keys print `D` or `C`, rerun `setup.sh` and open a new shell so the bash/zsh keybindings load.

## Copy And Paste

`Command-C` is not part of this tmux setup. It is usually handled by macOS or Parallels before Kali sees it.

Copy selections from tmux into the Kali clipboard:

1. Press `Control + Space`, then `[`.
2. Move with arrow keys or `h`, `j`, `k`, `l`.
3. Press `v` to start selecting.
4. Move to the end of the selection.
5. Press `y` or `Enter` to copy to the clipboard.

Paste from tmux:

```text
Control + Space, then ]
```

Mouse selection in copy-mode also copies to the Kali clipboard. If Parallels clipboard sharing is enabled, copied text should be available on macOS too.

Outside tmux, most Kali terminals use `Control + Shift + C` to copy and `Control + Shift + V` to paste because `Control-C` interrupts commands. See `PARALLELS.md` to make `Command + V` paste in Kali terminals.

## Config

| Action | Hotkey |
| --- | --- |
| Reload tmux config | `Control + Space`, then `r` |
| Create a new tmux session | `Control + Space`, then `Control + s` |

## Aliases

After running `setup.sh`, these aliases are available in bash and zsh.

| Alias | Meaning |
| --- | --- |
| `t` | Open or attach to the main tmux session |
| `ta <name>` | Attach to a tmux session |
| `tls` | List tmux sessions |
| `tn <name>` | Create a named tmux session |
| `tk <name>` | Kill a tmux session |
| `tr` | Reload `~/.tmux.conf` |
| `ll` | Detailed directory listing |
| `update` | `apt update` and `apt upgrade` |
| `myip` | Show IP addresses |
| `ports` | Show listening and connected ports |
| `serve` | Start a simple HTTP server in this directory |
| `clip` / `copy` | Copy stdin to the clipboard |
| `paste` | Print clipboard contents |
| `nmap-quick` | Fast common-port scan |
| `nmap-full` | Full-port scan |
| `nmap-scripts` | Default scripts and version detection |
