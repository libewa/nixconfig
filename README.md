# nixconfig
This is my [NixOS](https://nixos.org) system configuration.

## Installation

> [!IMPORTANT]  
> Read the whole text BEFORE modifying your system!

Look into `flake.nix`. If you are not using a QWERTZ keyboard and/or do not want your system to be localized in German, comment out the line saying `./modules/germanlocale.nix` under `yoga`. (it should be surrounded by `audio.nix` and `essentialpkgs.nix`)
You should now be ready to run this command:
```
sudo nixos-rebuild --experimental-features "nix-command flakes" boot --flake path:.#yoga
```
Nix will download all of the necessary packages and rebuild your system. After it's done, reboot.

You will see the Simple Desktop Display Manager (`sddm`). You will need to login twice due to a bug, but you're not done yet. Upon launching into Hyprland, you will see a big yellow bar telling you that you are using a "generated configuration".
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

Use this command (or `./activate`) for rebuilding from now on.

## Live CD Images
`./buildiso` (or `./buildiso de` for a German locale and keyboard layout) will build an ISO file ready for copying to an USB flash drive (or maybe even a DVD if you trim out enough packages). I have not gotten this to work yet, but only got a `No space left on device` error, so the Nix code is correct, my Nix store partition is just too small. Try it yourself, and see how it works. The default user is `nixos`, and should have no password (again, not tested).
