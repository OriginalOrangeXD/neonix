{
  services.kanshi = {
    enable = true;
    systemdTarget = "hyprland-session.target";

    profiles = {
      undocked = {
        outputs = [
          {
            criteria = "eDP-1";
            scale = 1.175;
            status = "enable";
          }
        ];
      };

      home_office_ultra = {
        outputs = [
          {
            criteria = "BNQ BenQ EX2780Q R4L01499019";
            position = "1920,0";
            mode = "2560x1440@120Hz";
          }
          {
            criteria = "eDP-1";
            status = "disable";
          }
          {
            criteria = "LG Electronics LG TV 0x01010101";
            position = "0,0";
            mode = "1920x1080@60Hz";
          }
        ];
      };
    };
  };
}

