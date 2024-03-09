{ pkgs, ... }:
{
  programs.zsh = {
	enable = true;
	shellAliases = {
		ll = "ls -l";
		update = "sudo nixos-rebuild switch";
    };
  };
}
