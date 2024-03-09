{ pkgs, ... }: {
  imports = [
    ./font.nix
    ./postgres.nix
    ./zsh.nix
    ./teensy.nix
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  services.usbmuxd.enable = true;	

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "America/New_York";
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
}
