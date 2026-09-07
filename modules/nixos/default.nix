{ config, ... }: {
  imports = [
    ./audio.nix
    ./brave-policies.nix
    ./gaming.nix
    ./niri-system.nix
    ./nvidia.nix
  ];
}
