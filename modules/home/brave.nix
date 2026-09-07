{ pkgs, ... }: {
  programs.chromium = {
    enable = true;
    package = pkgs.brave;

    extensions = [
      "nngceckbapebfimnlniiiahkandclblb" # BitWarden
    ];

    commandLineArgs = [
      "--password-store=basic"
      "--enable-gpu-rasterization"
      "--enable-oop-rasterization"
      "--use-gl=desktop"
      "--disable-accelerated-video-decode"
      "--enable-features=UseOzonePlatform"
      "--ozone-platform=wayland"
    ];
  };
}
