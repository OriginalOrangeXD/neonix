{ pkgs, ... }:
{
  ohMyZsh = {
    enable = true;
    plugins = [ "git" "thefuck" ];
  };
  interactiveShellInit = ''
	eval "$(starship init zsh)"
  '';
  programs.zsh = {
	enable = true;
	shellAliases = {
		ll = "ls -l";
		update = "sudo nixos-rebuild switch";
    };
  };
}
