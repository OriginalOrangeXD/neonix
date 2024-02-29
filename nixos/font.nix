{ pkgs, ... }:
{
  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; # use xkbOptions in tty.
  };
 
  environment.systemPackages = with pkgs; [
    terminus_font
    nerdfonts
  ];
  fonts ={
      packages = 
          with pkgs; [
          (nerdfonts.override { fonts = [ "Agave" ]; })
          ];
            fontconfig = {
      defaultFonts = {
        monospace = [ "AgaveNerdFontMono-Regular" ];
      };
    };
  };
}
