{ pkgs, ... }: {

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
    jack.enable = true;

    # System-wide background noise cancelling
    extraLadspaPackages = [ pkgs.deepfilternet ];

    # Self-contained True-Stereo Denoised Pipeline with Native Post-Filter Amplification
    extraConfig.pipewire."92-deepfilter-microphone" = {
      "context.modules" = [
        {
          name = "libpipewire-module-filter-chain";
          args = {
            "node.description" = "AT2020 DeepFilter Stereo Microphone";
            "media.name" = "AT2020 DeepFilter Stereo Microphone";
            "filter.graph" = {
              "nodes" = [
                # 1. The Real-time Noise Filtering Module
                {
                  "type" = "ladspa";
                  "name" = "DeepFilterNet";
                  "plugin" = "libdeep_filter_ladspa";
                  "label" = "deep_filter_stereo";
                  "control" = {
                    "Attenuation Limit (dB)" = 100.0;
                  };
                }
              ];
            };
            "capture.props" = {
              "node.name" = "deepfilter_input";
              "audio.position" = [ "FL" "FR" ];
              "node.passive" = true;
              "target.object" = "alsa_input.usb-Burr-Brown_from_TI_USB_Audio_CODEC-00.analog-stereo-input";
            };
            "playback.props" = {
              "node.name" = "AT2020_Cleaned";
              "media.class" = "Audio/Source";
              "audio.position" = [ "FL" "FR" ]; 
            };
          };
        }
      ];
    };
  };
}
