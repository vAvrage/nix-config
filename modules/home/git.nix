{ ... }: {
  programs.git = {
    enable = true;

    userName = "vAvrage";
    userEmail = "vavrage@proton.me";

    aliases = {
      st = "status";
      co = "checkout";
      br = "branch";
      cm = "commit";
      graph = "log --graph --oneline --all";
    };

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;

      core = {
        editor = "nvim";
	    whitespace = "fix,-indent-with-non-tab,trailing-space,cr-at-eol";
      };
    };
  };
}
