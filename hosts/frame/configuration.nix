# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{ inputs, pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ./temp.nix
    inputs.home-manager.nixosModules.default
  ];
  config = {
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "ruxy-lap"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.


  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    # keyMap = "us";
    useXkbConfig = true; # use xkb.options in tty.
  };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = false;


  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.robby = {
    isNormalUser = true;
    extraGroups = [ "wheel" "libvirtd" "networkmanager" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      firefox
      tree
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    kitty
    git
    firefox
    neovim
    typst-lsp
    vim 
    go
    bluez
    ripgrep
    wget
    corectrl
    clang-tools
    arduino
    nnn
    st
    neofetch
    kitty
    gh
    terminus_font
    starship
    git
    starship
    feh
    tldr
    zsh
    unzip
    xfce.thunar
    arduino-cli
    flameshot
    brightnessctl
    nerdfonts
    rust-analyzer
    arduino-language-server
    cachix
    teensy-loader-cli
    platformio
    poetry
    discord
    bmon
    obs-studio
    killall
    bat
    openssl
    keepassxc
    thefuck
    tmux
    neovim
  ];
   virtualisation.virtualbox.host.enable = true;
   users.extraGroups.vboxusers.members = [ "robby" ];
# rtkit is optional but recommended
security.rtkit.enable = true;
services.pipewire = {
  enable = true;
  alsa.enable = true;
  alsa.support32Bit = true;
  pulse.enable = true;
  # If you want to use JACK applications, uncomment this
  #jack.enable = true;
};

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  programs.hyprland.enable=true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  services.fprintd.enable =true;
  security.pam.services.login.fprintAuth = true;
  security.pam.services.xscreensaver.fprintAuth = true;
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ "root" "robby"];

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];

  networking.firewall.allowedUDPPorts = [ 5000 5001 5002 5003 ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "robby" = import ./home.nix;
    };
  };
xdg.portal.wlr.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.config.common.default = "gtk";

  system.stateVersion = "23.11"; # Did you read the comment?
  };

}

