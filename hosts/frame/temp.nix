# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ pkgs, ... }:
{
  nix.settings.trusted-users = [ "root" "robby" ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  services.usbmuxd.enable = true;	

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "America/New_York";
  virtualisation.docker.enable = true;

    # Enable sound.
  sound.enable = true;


  environment.systemPackages = with pkgs; [
    typst-lsp
    vim 
    gcc_multi
    docker
    go
    bluez
    zathura
    ripgrep
    wget
    corectrl
    clang-tools
    nnn
    dmenu
    alacritty
    emacs
    st
    neofetch
    kitty
    gh
    starship
    git
    busybox
    starship
    feh
    tldr
    zsh
    unzip
    arduino-cli
    flameshot
    rust-analyzer
    cachix
    poetry
    killall
    bat
    openssl
    gccgo13
    keepassxc
    thefuck
    tmux
    nitrogen
    neovim
  ];
  

  services.blueman.enable = true;
  services.gvfs.enable = true;

}
