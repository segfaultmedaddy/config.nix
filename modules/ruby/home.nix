{ pkgs, ... }: {
  programs.rbenv = {
    enable = true;
    enableZshIntegration = true;
    plugins = [{
      name = "ruby-build";
      src = pkgs.fetchFromGitHub {
        owner = "rbenv";
        repo = "ruby-build";
        rev = "v20240319";
        hash = "sha256-1xJ/Ew0QNy0ttl4TxZH1QwcuAtb5WwJoF2KdpcRZ4is=";
      };
    }];
  };
}
