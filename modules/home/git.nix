{ ... }: {
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "vAvrage";
        email = "vavrage@proton.me";
      };

      aliases = {
        st = "status";
        co = "checkout";
        br = "branch";
        cm = "commit";
        graph = "log --graph --oneline --all";
      };

      init = {
        defaultBranch = "main";
      };

      pull = {
        rebase = true;
      };

      core = {
        editor = "nvim";
	    whitespace = "fix,-indent-with-non-tab,trailing-space,cr-at-eol";
      };
    };
  };
}
