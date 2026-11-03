# Modules

Every file below `modules/` is loaded by
[import-tree](https://github.com/vic/import-tree) and registers one or more
`flake.nixosModules.*` entries. Hosts import them by name, e.g.
`self.nixosModules.bootEfi`.

## Base

`baseConfig` (`modules/features/base/config.nix`) is imported by every host. It
pulls in disko, nix-index-database, NUR and sops-nix, enables nixos-facter and
imports the following modules:

| Module                    | File                                   | Purpose                                             |
| ------------------------- | -------------------------------------- | --------------------------------------------------- |
| `audioPulse`              | `features/audio/pulse.nix`             | Audio stack                                         |
| `basePackages`            | `features/base/packages.nix`           | Zen kernel, CLI tools, fonts                        |
| `editorNeovim`            | `features/editor/neovim.nix`           | Wrapped Neovim as `$EDITOR`                         |
| `firmwareAll`             | `features/firmware/all.nix`            | Firmware                                            |
| `hardwareBluetooth`       | `features/hardware/bluetooth.nix`      | Bluetooth                                           |
| `hardwarePowermanagement` | `features/hardware/powermanagement.nix`| Power management                                    |
| `keymapUsIntl`            | `features/keymap/us-intl.nix`          | US international keymap                             |
| `localeDe`                | `features/locale/de.nix`               | German locale                                       |
| `muxTmux`                 | `features/mux/tmux.nix`                | tmux                                                |
| `networkManager`          | `features/network/network-manager.nix` | NetworkManager                                      |
| `nixSettings`             | `features/nix/settings.nix`            | Flakes, Cachix substituter, daily GC, nix-ld        |
| `shellFish`               | `features/shell/fish.nix`              | fish shell                                          |
| `userFarbzen`             | `users/farbzen.nix`                    | Main user with packages and sops age key            |
| `userRoot`                | `users/root.nix`                       | root with fish                                      |
| `vpnOpenVPN`              | `features/vpn/openvpn/base.nix`        | OpenVPN with systemd password prompt                |

## Optional modules

| Module                      | File                                  | Purpose                                   |
| --------------------------- | ------------------------------------- | ----------------------------------------- |
| `bootEfi`                   | `features/boot/efi.nix`               | systemd-boot, quiet boot with Plymouth    |
| `bootBios`                  | `features/boot/bios.nix`              | GRUB on `/dev/sda`, quiet boot            |
| `desktopHyprlandDux`        | `features/desktop/hyprland.nix`       | Hyprland (UWSM), dux shell and greeter    |
| `desktopGnome`              | `features/desktop/gnome.nix`          | GNOME with GDM                            |
| `desktopCommon`             | `features/desktop/common.nix`         | 1Password, Chrome, Zen Browser            |
| `gamingSteam`               | `features/gaming/steam.nix`           | Steam with open firewall ports            |
| `graphicsNvidia`            | `features/graphics/nvidia.nix`        | Proprietary NVIDIA driver                 |
| `graphicsIntelPreBroadwell` | `features/graphics/intel.nix`         | VA-API for older Intel GPUs               |
| `serviceSSH`                | `features/service/ssh.nix`            | OpenSSH without root login                |
| `vmQemu`                    | `features/virtualization/virtual-machines.nix` | libvirt and virt-manager         |
| `vpnOpenVPNNurgle`          | `features/vpn/openvpn/nurgle.nix`     | OpenVPN profile from sops secrets         |
| `vpnOpenVPNTzeentch`        | `features/vpn/openvpn/tzeentch.nix`   | OpenVPN profile from sops secrets         |
| `vpnWireguardTerra`         | `features/vpn/wireguard/wireguard.nix`| WireGuard `wg-terra`, no autostart        |

All paths are relative to `modules/`.

## Adding a host

1. Create `modules/hosts/<host>/configuration.nix` defining
   `flake.nixosConfigurations.<host>` with `baseConfig` and the wanted modules.
2. Add `_disko-config.nix` for the disk layout.
3. Generate the hardware report on the target machine and commit it:

   ```sh
   sudo nixos-facter -o modules/hosts/<host>/facter.json
   ```

> [!NOTE]
> Files prefixed with `_` are ignored by import-tree and must be imported
> explicitly by the host.
