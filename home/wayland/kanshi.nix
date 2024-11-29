{
  services.kanshi = {
    enable = true;
    systemdTarget = "hyprland-session.target";

    profiles = {
      undocked = {
        outputs = [
          {
            criteria = "eDP-1";
            scale = 1.333333;
            status = "enable";
          }
        ];
      };

      home_office_ultra = {
        outputs = [
          {
            criteria = "BNQ BenQ EX2780Q R4L01499019";
            position = "0,0";
            scale = 1.0;
            mode = "2560x1440@120Hz";
          }
          {
            criteria = "eDP-1";
            status = "disable";
          }
        ];
      };
    };
  };
}

