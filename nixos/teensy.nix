{ pkgs, ... }:
{
  services.udev.extraRules = ''
      # UDEV rules for Teensy USB devices
      ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04[789B]?", ENV{ID_MM_DEVICE_IGNORE}="1"
      ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04[789A]?", ENV{MTP_NO_PROBE}="1"
      SUBSYSTEMS=="usb", ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04[789ABCD]?", MODE:="0666"
      KERNEL=="ttyACM*", ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04[789B]?", MODE:="0666"
      # UDEV rules for rp2040 USB devices
      ATTRS{idVendor}=="2e8a", ENV{ID_MM_DEVICE_IGNORE}="1"
      ATTRS{idVendor}=="2e8a", ENV{MTP_NO_PROBE}="1"
      SUBSYSTEMS=="usb", ATTRS{idVendor}=="2e8a", MODE:="0666"
      KERNEL=="ttyACM*", ATTRS{idVendor}=="2e8a", MODE:="0666"
  '';
  services.udev.packages = [ 
      pkgs.platformio
      pkgs.openocd
  ];
  environment.systemPackages = with pkgs; [
    teensy-loader-cli
    platformio
    arduino-language-server
    arduino
  ];
}
