{ pkgs, ... }:
{
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  services.blueman.enable = true;
  services.gvfs.enable = true;
  hardware.bluetooth.powerOnBoot = true;
}
