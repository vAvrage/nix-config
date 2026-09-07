{ ... }: {
  programs.chromium = {
    enable = true;
    extraOpts = {
      # VRAM / Memory leak mitigation policies
      "HighEfficiencyModeEnabled" = true;
      "HighEfficiencyModePerformanceDiscardsEnabled" = true;
      "HighEfficiencyModeAggressiveness" = 2;

      # Feature removal to save system and GPU resources
      "BraveWalletDisabled" = true;
      "BraveRewardsDisabled" = true;
      "BraveVPNDisabled" = true;
      "BraveAIChatEnabled" = false;

      # Hardened Privacy & Telemetry Blocks
      "BraveP3AEnabled" = false;
      "BraveStatsPingEnabled" = false;
      "BraveWebDiscoveryEnabled" = false;

      # UI Debloat & Extra Core Blocks
      "BraveNewsDisabled" = true;
      "BraveTalkDisabled" = true;
    };
  };
}
