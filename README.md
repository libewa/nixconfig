# nixconfig
This is my [NixOS] system configuration.

## Installation

> [!IMPORTANT]  
> Read the whole text BEFORE modifying your system!

> [!NOTE]
> If you are new to Linux, do not start with NixOS. Try [Fedora] or [Mint] instead.
> 
> When looking for solutions online, search "NixOS" specifically. Use
> <wiki.nixos.org>, not nixos.wiki.

This configuration uses [Disko] for partition management, so you will need to
wipe your hard drive. BACKUP YOUR FILES!

First, create a NixOS USB using the normal methods, and boot into it.
Create a Nix Shell with `git` and flakes.


```shell
nix shell --experimental-features "nix-command flakes" nixpkgs#git
```

> [!TIP]
> If your configuration has Flakes enabled, such as when booting from an ISO
> with this configuration, you can omit the `--experimental-features` flag.

Clone the repsitory.

```shell
git clone https://github.com/libewa/nixconfig
```

Copy (or rename) the [`hosts/yoga/`] directory, change `networking.hostName`
(in `configuration.nix`)  and `users.nix`, and change `programs.nh.flake` to use
your username.

Open [`flake.nix`] search for `outputs.nixosConfigurations.yoga`
(around line 40) and change its name to your new hostname and fix all of the
file paths. You can also add or remove modules here.

Optionally, modify [`modules/system/locale.nix`] to set a different locale, or
remove it **and** the reference in [`flake.nix`] and commit your changes.

Push to a remote or recursively copy the configuration directory to build upon
your changes later.

Then, to activate the configuration, run Disko.

> [!CAUTION]
> This will wipe your hard drive! All data will be lost!
> Make sure your backups are up to date.

```shell
sudo nix run 'github:nix-community/disko/latest#disko-install' -- --flake .#<flake attribute> --disk sda <device>
```

If you are using this configuration's ISO, you can also use the shortcut script:

```shell
sudo install-os <flake attribute> <device>
```

Replace `<flake attribute>` with the flake attribute you want to configure,
like `yoga`, and `<device>` with a raw disk device path (like `/dev/sda`).

If your nix-store runs out of space (or the oom-reaper even kills your
build process), the NixOS install is too large. You can try removing packages
or using [Disko] manually.

```shell
sudo nixos-rebuild boot --flake ~/nixconfig#<flake attribute>
reboot
```

After rebooting, log in, open a terminal (the KDE one is called Konsole), and
and build your home configuration:

```shell
nh home switch
```
Reboot again, for good measure, and voilà: Your own NixOS install is finished.
This is the point where you do a [system update](#full-system-update).

## Building a Live CD ISO image

Building an ISO image is easier, as NixOS provides templates for insecure setups
like this.

Simply set aside a lot of space for your nix store, run this build command, and
wait around 15 minutes:

```shellsession
$ nix build .#iso-term
```

Then, boot the ISO however you would do with one from [nixos.org][NixOS], or any 
other Linux livedisc.

## Hacking

This configuration includes the NixOS helper `nh`. For `nh` to function, the 
configuration must be at the location specified in `programs.nh.flake`.

All new files must be in some way imported by the appropriate configuration in
[`flake.nix`]. They can either be directly imported, or listed in another file's
`imports` attribute. Here, the files doing the latter are always named
`default.nix` for recognizability. They also have the special attribute of being
able to be included only by their parent directory's name.

### Commands
The most important commands for system maintenance are:

#### Full system update
On rolling release distros, you should always update the entire system at once.
Nix makes it quite hard to do something else.

```shell
nix flake update --commit-lock-file
nh home switch
nh os boot
reboot
```

#### Home rebuild

Rebuilds your user space, after modifying [`home.nix`] or any file in
[`modules/home/`].

```shell
nh home switch
```

#### System rebuild

Rebuilds the system configuration, after modifying `flake.nix` or any file in
either [`hosts/`] or [`modules/system`].

```shell
nh os switch
```

When changing configurations for SDDM, Grub, or after large modifications, do
not apply the new configuration immediatly, only after a reboot:

```shell
nh os boot
reboot
```

[NixOS]: https://nixos.org
[Fedora]: https://fedoraproject.org/
[Mint]: https://www.linuxmint.com/
[Disko]: https://github.com/nix-community/disko?tab=readme-ov-file
[`hosts/yoga/`]: ./hosts/yoga/
[`modules/system/locale.nix`]: ./modules/system/germanlocale.nix
[`flake.nix`]: ./flake.nix
[`home.nix`]: ./home.nix
[`modules/home/`]: ./modules/home/
[`hosts/`]: ./hosts/
[`modules/system`]: ./modules/system/

