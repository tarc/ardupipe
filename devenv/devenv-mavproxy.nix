{ pkgs, ... }:
{
  packages = with pkgs; [
    mavproxy
    pyEnv
  ];

  languages = {
    python = {
      enable = true;
      package = pkgs.pyEnv;
    };
  };

  git-hooks = {
    hooks = {
      formatter = {
        enable = true;
        name = "nixfmt";
        description = "nixfmt RFC style!";
        files = "\.nix$";
        entry = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
      };

      shellcheck.enable = true;
      shfmt.enable = false;
      deadnix = {
        enable = true;
        settings = {
          edit = true;
          noLambdaArg = true;
        };
      };
    };
  };
}
