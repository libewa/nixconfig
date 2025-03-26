# nixconfig
This is my [NixOS] system configuration.

## Installation

> [!IMPORTANT]  
> Read the whole text BEFORE modifying your system!

This configuration uses [Disko] for partition management, so you will need to wipe
your hard drive. BACKUP YOUR FILES!

First, create a NixOS USB using the normal methods, and boot into it. Create a Nix
Shell with `git` and flakes.

```shell
nix shell --experimental-features "nix-command flakes" nixpkgs#git
```

> [!TIP]
> If your configuration has Flakes enabled, such as when booting from an ISO with this configuration, you can omit the `--experimental-features` flag.

Clone the repsitory.

```shell
git clone https://github.com/libewa/nixconfig
```

Optionally, modify [`modules/system/germanlocale.nix`] to set a different locale, or
remove the reference in [`flake.nix`] and commit your changes.

You should also change [`modules/system/users.nix`], to configure users and set a password, using a hash from `mkpasswd`. Again, commit your changes.

Push to a remote if you want to build upon your changes later.

Then, to activate the configuration, run Disko.

> [!CAUTION]
> This will wipe your hard drive! All data will be lost!
> Make sure your backups are up to date.

```shell
sudo nix run 'github:nix-community/disko/latest#disko-install' -- --flake .#yoga --disk sda /dev/sda
```

After a long time, you can reboot, and your system should work.

You will see the Simple Desktop Display Manager (`sddm`). You will need to login
twice due to a bug, but you're not done yet. Upon launching into Hyprland, you will
see a big yellow bar telling you that you are using a "generated configuration".

To remove this bar, simply activate the included home-manager configuration.

> [!NOTE]
> After this, the keyboard layout (when logged in) will be set to [Neo bone].

Open `kitty` by pressing SUPER and Q, and run this:

```shell
nh home switch
```

Reboot, for good measure.

Your setup should now be pretty much identical to mine.

## Building a Live CD ISO image

Building an ISO image is easier, as NixOS provides templates for insecure setups like this.

Simply set aside a lot of space for your nix store, run this build command, and wait around 15 minutes:

```shellsession
$ nix build .
```

Then, boot the ISO however you would do with one from [nixos.org][NixOS], or any other Linux livedisc.

## Hacking

To modify the configuration for your own need, copy the [`hosts/yoga/`]
folder and rename it to your local hostname. You can optionally delete it if it's
not needed anymore. In [`flake.nix`], add a new entry to the `nixos-configurations`
object, with your host name as the key. You can copy the `yoga` entry for this.
Comment out or remove [`modules/system/germanlocale.nix`] if you use a QWERTY and not a QWERTZ keyboard.

Then, rebuild with this command:

```shell
nh os switch
```

Use this command for rebuilding from now on.

[NixOS]: https://nixos.org
[Disko]: https://github.com/nix-community/disko?tab=readme-ov-file
[Neo bone]: https://neo-layout.org/Layouts/bone/
[`modules/system/users.nix`]: ./modules/system/users.nix
[`modules/system/germanlocale.nix`]: ./modules/system/germanlocale.nix
[`flake.nix`]: ./flake.nix
[`hosts/yoga/`]: ./hosts/yoga/