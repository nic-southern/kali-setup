# Parallels Settings For Kali

These settings pair with `tmux.conf` and `HOTKEYS.md`.

Goal:

- `Control` works normally inside Kali, including `Control-C`.
- `Option` is sent to Kali as `Alt` / `Meta` for normal terminal word movement.
- `Command` stays mostly reserved for macOS and Parallels.
- Copying from tmux lands in the Kali clipboard and syncs back to macOS.

## Required VM Settings

Open Parallels with the Kali VM selected.

1. Go to `Actions` > `Configure`.
2. Open `Options` > `Sharing`.
3. Enable `Share Mac clipboard`.
4. If there is an isolation option, make sure the VM is not isolated from the Mac.
5. Reinstall or update Parallels Tools if clipboard sharing still does not work.

## Keyboard Shortcuts

Open `Parallels Desktop` > `Settings` > `Shortcuts`.

Recommended starting point:

- `macOS System Shortcuts`: `Auto`
- `Keyboard Menu`: leave `Command` shortcuts for macOS
- `Mouse Shortcuts`: do not use plain `Control` as a mouse shortcut

If Kali does not receive `Option` combos, change `macOS System Shortcuts` to `Always` while the VM is focused. That makes the VM more keyboard-native, but it may also send more macOS-style shortcuts into Kali.

## Command-V In The Terminal

This is mostly a terminal thing. Linux terminals use `Control-C` for interrupting a running command, so terminal copy and paste are usually:

- Copy: `Control + Shift + C`
- Paste: `Control + Shift + V`

Goal: make `Command + V` send `Control + Shift + V` while the Kali VM is focused.

Best Parallels mapping:

1. Open `Parallels Desktop` > `Settings` > `Shortcuts`.
2. Select the Kali VM profile if it appears in the sidebar.
3. Add a shortcut mapping `Command + V` to `Control + Shift + V`.
4. Optional: map `Command + C` to `Control + Shift + C`.

If Parallels does not support that mapping on your version, run `setup.sh`. It installs an `xbindkeys` fallback for Kali desktop sessions:

- `Command + V`, if received as Linux `Super + V`, sends `Control + Shift + V`.
- `Command + C`, if received as Linux `Super + C`, sends `Control + Shift + C`.

The fallback only works if Parallels passes the Command key through to Kali as `Super`. If Parallels consumes `Command + V` before Kali sees it, use the Parallels shortcut mapping instead.

Use these copy paths too:

- In tmux: `Control + Space`, then `[`, select text, then `y`.
- In a Kali terminal outside tmux: `Control + Shift + C`.
- From a command: `echo "text" | copy`.

## macOS Shortcuts To Check

Open macOS `System Settings` > `Keyboard` > `Keyboard Shortcuts`.

Check these if tmux keys are not reaching Kali:

- `Input Sources`: disable or change `Control + Space` if it switches input sources.
- `Mission Control`: disable or change `Control + Arrow` shortcuts if you decide to use them in Kali later.
- `Spotlight`: `Command + Space` can stay on macOS; this tmux setup does not use it.

## Quick Keyboard Test In Kali

Run this in a Kali terminal:

```bash
showkey -a
```

Then press:

- `Control + c`
- `Control + Space`
- `Option + Left`
- `Control + Option + h`

Expected:

- `Control + c` shows an interrupt-style control character.
- `Control + Space` should show a control-space/null style event.
- `Option` keys should show escape-prefixed sequences, often starting with `^[`.
- `Control + Option` keys should also reach Kali for tmux pane movement.

Press `Control + d` to exit `showkey`.

## Clipboard Test

In Kali:

```bash
echo "hello from kali" | copy
```

Then paste on macOS. If it does not paste:

1. Confirm `Share Mac clipboard` is enabled in Parallels.
2. Confirm Parallels Tools are installed in Kali.
3. Run `echo "hello" | xclip -selection clipboard`.
4. Try copying from a normal Kali desktop app to confirm the VM clipboard works outside tmux.
