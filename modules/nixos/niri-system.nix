{ pkgs, ... }: {
  programs.niri.enable = true;

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    alacritty
    git
    gnome-keyring
    ladspa-sdk
    mpv
    mpvpaper
    neovim
    nvtopPackages.nvidia
    p7zip
    xwayland-satellite
    unrar
    unzip
    zip
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
  ];

  services.displayManager.ly.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
    config.common.default = [ "gnome" "gtk" ];
  };
}
