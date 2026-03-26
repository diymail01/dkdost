# NixOS Abyss Configuration

A premium, dynamic Dotfiles configuration for NixOS centered around Hyprland, Pywal (dynamic theming), Rofi, and Waybar.

## Features
- **Window Manager**: Hyprland
- **Dynamic Theming**: Pywal16 automatically themes Rofi, Waybar, and system colors based on the current wallpaper.
- **App Launcher / Menus**: Rofi (Apps, Wallpapers, Power, Clipboard)
- **Lock Screen**: Hyprlock (Style-8 inspired, split gold/white time)
- **Status Bar**: Waybar
- **Terminal**: Kitty
- **Secrets Management**: sops-nix

---

## 🚀 Replication Instructions (New System)

Follow these steps to replicate this exact configuration on a fresh NixOS installation.

### 1. Prerequisites
You must be running NixOS with Flakes enabled.
If not enabled yet, run this temporarily:
```bash
nix shell nixpkgs#git
```

### 2. Clone the Repository
Clone these dotfiles into `~/nixos-config`:
```bash
git clone <your-repo-url> ~/nixos-config
cd ~/nixos-config
```

### 3. Setup Secrets (SOPS)
This configuration uses `sops-nix`. You must provide your `age` key to decrypt the secrets.
```bash
mkdir -p ~/.config/sops/age
# Place your keys.txt here:
# nano ~/.config/sops/age/keys.txt
```
**After placing your key:**
Ensure your secrets file (`secrets/secrets.yaml`) is properly encrypted and tracked by git. If you need to edit or create new secrets:
```bash
nix-shell -p sops --run "sops secrets/secrets.yaml"
```

### 4. Dev Shells (Per-Project Environments)
This repository includes isolated development environments (`dev-shells/flake.nix`). Instead of installing tools globally, use dev shells for specific projects.
To enter a shell, run:
```bash
nix develop ~/nixos-config/dev-shells#node     # For Node.js / NPM / Yarn
nix develop ~/nixos-config/dev-shells#python   # For Python 3 & Pip
nix develop ~/nixos-config/dev-shells#rust     # For Rust / Cargo
```

### 5. Hardware Configuration
Generate the hardware config for your specific machine and replace the placeholder one:
```bash
sudo nixos-generate-config --show-hardware-config > hosts/user0/hardware-configuration.nix
```

### 5. Build and Apply
Run the flake build command to apply the configuration. This might take a while on the first run as it downloads all packages via Home Manager.
```bash
sudo nixos-rebuild switch --flake .#user0
```

### 6. First-Time Setup Post-Install

After rebooting into Hyprland, you need to initialize the dynamic theming and wallpaper system.

1. **Pick a Wallpaper & Generate Colors**:
   Press `SUPER + T` to open the Rofi Wallpaper Picker.
   Select an image. This will:
   - Set the wallpaper via `swww`
   - Create a symlink for Hyprlock (`~/.cache/current_wallpaper`)
   - Run `pywal16` to generate `~/.cache/wal/colors-rofi-dark.rasi` and Waybar css.

2. **Verify Lock Screen**:
   Press `SUPER + SHIFT + L` to test the new Hyprlock lock screen. It should load instantly using the symlinked wallpaper.

---

## ⌨️ Keybinds

| Keybind | Action |
|---------|--------|
| `SUPER + Return` | Open Terminal (Kitty) |
| `SUPER + D` | Open App Launcher (Rofi) |
| `SUPER + T` | Open Wallpaper Picker |
| `SUPER + X` | Open Power Menu |
| `SUPER + C` | Open Clipboard History |
| `SUPER + N` | Open Notification Center (SwayNC) |
| `SUPER + SHIFT + L` | Lock Screen (Hyprlock) |
| `SUPER + Q` | Kill active window |
| `SUPER + V` | Toggle floating window |
| `SUPER + F` | Toggle fullscreen |


## Todo 

- [ ] add lots of wallpapers
- [ ] notification manager
- [ ] wifi 
- [ ] icons