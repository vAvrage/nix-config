{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernelModules = [ "uinput" ];

  networking.hostName = "nnn-desktop";
  networking.networkmanager.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
	UserspaceHID = true;
      };
    };
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/avrage/nnn";
  };

  users.users.avrage = {
    isNormalUser = true;
    description = "Avrage";
    extraGroups = [ "audio" "input" "networkmanager" "pipewire" "realtime" "video" "wheel" ];
    shell = pkgs.zsh;
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "24.11";
    
  time.timeZone = "Australia/Adelaide";
}
