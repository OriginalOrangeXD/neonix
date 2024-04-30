{ pkgs, ... }:
{
  programs.zsh = {
	  enable = true;
	  ohMyZsh = {
		  enable = true;
		  plugins = [ "git" "thefuck" ];
		  theme = "robbyrussell";
	  };
	  shellAliases = {
		  ll = "ls -l";
		  update = "sudo nixos-rebuild switch";
	  };
  };
}
