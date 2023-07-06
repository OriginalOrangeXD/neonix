# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ 
	"amdgpu"        
	"vfio_pci"
        "vfio"
        "vfio_iommu_type1"
        "vfio_virqfd"
  ];
  boot.kernelModules = [ "kvm-amd" "vfio" "vfio_iommu_type1" "vfio_pci" "vfio_virqfd" ];
  boot.kernelParams = ["iommu=pt" "iommu=1" "amd_iommu=on" "amdgpu.ppfeaturemask=0xffffffff" ];
  boot.extraModulePackages = [ ];
  boot.extraModprobeConfig = "options vfio-pci ids=:,:";

  fileSystems."/" =
    { device = "/dev/disk";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/";
      fsType = "vfat";
    };

  fileSystems."/home/ruxy/virtual/drives" =
    { device = "/dev/disk/";
      fsType = "ext4";
    };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp5s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp4s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
