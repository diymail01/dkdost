{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # -------------------------------------------------
  # Bootloader
  # -------------------------------------------------
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # -------------------------------------------------
  # Host & Networking
  # -------------------------------------------------
  networking.hostName = "user0";
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;

  # -------------------------------------------------
  # Time & Locale
  # -------------------------------------------------
  time.timeZone = "Asia/Kolkata";

  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # -------------------------------------------------
  # Display stack (GNOME + Wayland)
  # -------------------------------------------------
  services.xserver.enable = true;

  services.displayManager.gdm.enable = true;
  services.displayManager.gdm.wayland = true;

  services.desktopManager.gnome.enable = true;
    programs.hyprland.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # -------------------------------------------------
  # Printing
  # -------------------------------------------------
  services.printing.enable = true;

  # -------------------------------------------------
  # Audio (PipeWire)
  # -------------------------------------------------
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # -------------------------------------------------
  # Shells (availability only, config later via HM)
  # -------------------------------------------------
  programs.zsh.enable = true;
  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    bashInteractive
    zsh
    fish
    git
  ];

  # -------------------------------------------------
  # SOPS (Secrets)
  # -------------------------------------------------
  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    age.keyFile = "/home/batman/.config/sops/age/keys.txt";
  };

  # -------------------------------------------------
  # Users
  # -------------------------------------------------
  users.users = {
    batman = {
      isNormalUser = true;
      description = "Bruce Wayne";
      shell = pkgs.zsh;
      extraGroups = [ "wheel" "networkmanager" ];
    };

    ironman = {
      isNormalUser = true;
      description = "Tony Stark";
      shell = pkgs.fish;
      extraGroups = [ "wheel" "networkmanager" ];
    };

    omniman = {
      isNormalUser = true;
      description = "Nowl Ahn";
      shell = pkgs.bashInteractive;
      extraGroups = [ "networkmanager" ];
    };
  };

  # -------------------------------------------------
  # Browser (temporary)
  # -------------------------------------------------
  programs.firefox.enable = true;

  # -------------------------------------------------
  # Nix settings (flake-ready)
  # -------------------------------------------------
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  # -------------------------------------------------
  # State version (NEVER change)
  # -------------------------------------------------
  system.stateVersion = "25.11";
}
