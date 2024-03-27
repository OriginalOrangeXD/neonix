{
    pkgs,
    inputs,
    ...
}:

{
  imports = [
    ./hardware.nix
    ../../nixos
    inputs.home-manager.nixosModules.default
  ];

  config = {
    nixpkgs.hostPlatform.system = "x86_64-linux";
  system.stateVersion = "23.11"; # Did you read the comment?
  nix.settings.trusted-users = [ "root" "robby" ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

    hardware.opengl= {
      enable = true;
      extraPackages= with pkgs; [
        vaapiVdpau
          libvdpau-va-gl
          amdvlk
      ];
    };

    networking.firewall.enable = false;
    networking.enableIPv6 = false;
    virtualisation.docker.rootless = {
      enable = true;
      setSocketVariable = true;
    };
    users.users.robby = {
      isNormalUser = true;
      extraGroups = [ "docker" "wheel" "input" "libvirtd" "video" "audio"]; # Enable ‘sudo’ for the user.
        packages = with pkgs; [
        lutris
          steam
          xfce.thunar
          cura
          firefox
          arduino
          discord
          tree
          obs-studio
        ];
    };
    services.nix-serve = {
      enable = true;
      secretKeyFile = "/home/robby/keys/cache-priv-key.pem";
    };
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };


# List packages installed in system profile. To search, run:
# $ nix search wget
    environment.systemPackages = with pkgs; [
        write_stylus
        libimobiledevice
        freecad
	xdg-desktop-portal-hyprland
        (lutris.override {
         extraPkgs = pkgs: [
         wineWowPackages.stable
         winetricks
         ];
         })

    ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = { 
      "robby" = import ./home.nix; 
    };
  };

    services = {
      syncthing = {
        enable = true;
        user = "robby";
        dataDir = "/home/robby/syncthing";
        configDir = "/home/robby/syncthing/.config/syncthing";
        overrideDevices = true;     # overrides any devices added or deleted through the WebUI
          overrideFolders = true;     # overrides any folders added or deleted through the WebUI
          devices = {
            "touch" = { id = "UTCVJC7-GLJRFVT-HP2AW2J-KSVJVUU-F5JVJG3-LKR2CSJ-BF5K45V-O7Z3AAP"; };
            "boox" = { id =  "YQYN5TV-K7IPUBA-LYOMHSB-HR2R7IF-C4PUAKP-Q237CBU-D7ZJKZO-N4MLDQZ"; };
          };
        folders = {
          "Music" = {        # Name of folder in Syncthing, also the folder ID
            path = "/home/robby/Music";    # Which folder to add to Syncthing
              devices = [ "touch" "boox" ];      # Which devices to share the folder with
          };
          "Books" = {        # Name of folder in Syncthing, also the folder ID
            path = "/home/robby/Books";    # Which folder to add to Syncthing
              devices = [ "touch" "boox" ];      # Which devices to share the folder with
          };
        };
      };
    };
  xdg.portal = { enable = true; extraPortals = [ pkgs.xdg-desktop-portal-gtk ]; };

    services.openssh = {
      enable = true;
# require public key authentication for better security
      settings.PasswordAuthentication = true;
      settings.KbdInteractiveAuthentication = false;
#settings.PermitRootLogin = "yes";
    };
	  programs.hyprland.enable = true;
  };
}

