{inputs, pkgs,...}: let
  system = pkgs.system;
in {
  programs.neovim = inputs.ruxy-nvim.lib.mkHomeManager {inherit system;};
}
