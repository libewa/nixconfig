# nixconfig
This is my [NixOS](https://nixos.org) system configuration.

## Installation

> [!IMPORTANT]  
> Read the whole text BEFORE modifying your system!

You can't use this configuration directly. To use it, clone the GitHub repo and copy [modules/users.nix.template](./modules/users.nix.template) to [hosts/yoga/users.nix](./hosts/yoga/users.nix). Then, modify that file according to [the NixOS manual](https://nixos.org/manual/nixos/stable/#sec-user-management).
Additionally, copy `hardware-configuration.nix` from `/etc/nixos/configuration.nix` into the repository root.
Look into `flake.nix`. If you do not use a QWERTZ keyboard, comment out the line saying `./modules/germanlocale.nix` under `yoga`. (it should be surrounded by `audio.nix` and `essentialpkgs.nix`)
You should now be ready to run this command:
```
sudo nixos-rebuild --experimental-features "nix-command flakes" boot --flake path:.#yoga
```
Nix will download all of the necessary packages and rebuild your system. After it's done, reboot.

You will see the GNOME Display Manager (`gdm`). You will need to login twice due to a bug, but you're not done yet. Upon launching into Hyprland, you will see a big yellow bar telling you that you are using a "generated configuration".
To remove this bar, launch the `kitty` terminal emulator, and install `home-manager` according to [its manual](https://nix-community.github.io/home-manager/index.xhtml#sec-flakes-standalone). You need to find a home configuration that includes a Hyprland config, like mine, and clone it so `flake.nix` and `home.nix` are in `$HOME/.config/home-manager/`:
```
git clone https://github.com/libewa/home-manager ~/.config/home-manager
```
Then, follow the manual and reboot.

Your setup should now be pretty much identical to mine.

## Hacking

To modify the configuration for your own need, copy the [hosts/yoga](./hosts/yoga/) folder and rename it to your local hostname. You can optionally delete it if it's not needed anymore. In `flake.nix`, add a new entry to the `nixos-configurations` object, with your host name as the key. You can copy the `yoga` entry for this. Comment out or remove `./modules/germanlocale.nix` if you use a QWERTY and not a QWERTZ keyboard.
Then, rebuild with this command:
```
sudo nixos-rebuild switch --flake path:.#
```

Use this command (or `./apply`) for rebuilding from now on.

## Live CD Images

`./buildiso` (or `./buildiso de` for QWERTZ layout) should yield you a bootable ISO image. However, there is an infinite recursion somewhere, which I'd be happy if someone found.