{ config, pkgs, ... }: {
  config = {
    home.packages = with pkgs; [ material-design-icons nerdfonts ];
    programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = ''
        * {
        	font-family: 'M+1Code Nerd Font';
        	font-size: 16px;
          color: #ebdbb2;
        }
        #waybar {
          background: transparent;
          border-radius: 5px;
        }

        #workspaces{
         border-radius:5px;
          box-shadow:0px 0px black;
        }
        window#waybar {
    background: transparent;
}


#workspaces,
#network,
#backlight,
#wireplumber,
#clock,
#battery,
#idle_inhibitor,
#custom-lizzy,
#bluetooth,
#custom-power,
#custom-notification{
  margin-left:5px;
  margin-right: 5px;
  background: #141b1e;
  border-radius:5px 0px 0px 5px;
  padding-left:10px;
  padding-right: 10px;
}
        
#network,
#wireplumber,
#backlight,
#bluetooth{
  margin:0px;
}
#backlight{
  border-radius: 0px 5px 5px 0px;
}
#network,
#bluetooth{
  border-radius:0px;
}

#idle_inhibitor,
#clock,
#workspaces,
#custom-lizzy,
#custom-power,
#battery,
#custom-notification{
  border-radius: 5px;
}

#idle_inhibitor.activated{
  color:#e57474;
}

#custom-power{
color:#689d6a;
margin-right:10px;
padding-right:14px;
}
    '';
      settings = [{
      layer = "top";
      position = "bottom";
      reload_style_on_change = true;

      height = 20;
      margin-bottom = 5;
      margin-left = 5;
      margin-right = 5;
      modules-center = [ "clock" ];
      modules-left = [ "hyprland/workspaces" "hyprland/mode" ];
      modules-right = [
        "custom/notification"
        "wireplumber"
        "network"
        "backlight"
        "clock#time"
        "battery"
      ];
      "hyprland/workspaces" = {
        all-outputs = true;
		    format = "{icon}";
		    format-icons= {
		        "1"= "";
		        "2"= "";
		        "3"= "󰢔";
		        "4"= "";
		        "5"= "󰺿";
        };
      };
      backlight = {
        format = "<span color='#689d6a'>󱩖 </span>  {percent}%   ";
        device = "intel_backlight";
        on-scroll-down = "brightnessctl s 5%-";
        on-scroll-up = "brightnessctl s +5%";
      };
      
      clock = {
        format= "<span color='#b16286'></span>  {:%A %e %B}";
      };
      cpu = {
        format = "{usage}% ";
        tooltip = false;
      };
      memory = { format = "{}% "; };
        # network = {
        #   interval = 1;
        #   format-alt = "{ifname}: {ipaddr}/{cidr}";
        #   format-disconnected = "Disconnected ⚠";
        #   format-linked = "{ifname} (No IP) ";
        # };
      network = {
        format-wifi = "<span color='#458588'></span>   {essid}  ";
        format-etherne = "<span color='#458588'></span>   {ifname}";
        format-linked = "<span color='#458588'></span>  {ifname} (No IP)";
        format= "<span color='#458588'></span>  Connected";
        format-disconnected= "<span color='#458588'></span>  Disconnected";
        interval= 60;
        on-click="~/.config/rofi/rofi-wifi-menu.sh";
      };
      wireplumber = {
        on-click = "pavucontrol";
        on-click-right = "amixer sset Master toggle 1>/dev/null";
        format = "<span foreground='#e5c76b'>{icon}</span>  {volume}%";
        format-muted =  "<span foreground='#e5c76b'></span>  Muted";
        format-bluetooth = "{volume}% {icon} {format_source}";
        format-bluetooth-muted = " {icon} {format_source}";
        format-icons = {
          car = "";
          default = [ "" "" "" ];
          handsfree = "";
          headphones = "";
          headset = "";
          phone = "";
          portable = "";
        };
        format-source = "{volume}% ";
        format-source-muted = "";
      };
      battery = {
        interval= 2;
        states = {
            good = 95;
            warning = 30;
            critical = 15;
        };
        format = "<span color='#689d6a'>{icon}</span>   {capacity}%";
        format-charging = "<span color='#689d6a'></span>  {capacity}%";
        format-plugged  = "<span color='#689d6a'></span>  {capacity}%";
        format-icons = [
            ""
            ""
            ""
            ""
            ""
        ];
      };
      language = {
            format-dh = "  dh";
            format-en = "  ru";
            keyboard-name = "at-translated-set-2-keyboard";
            on-click = "hyprctl switchxkblayout at-translated-set-2-keyboard next";
      };

      temperature = {
        critical-threshold = 80;
        format = "{temperatureC}°C {icon}";
        format-icons = [ "" "" "" ];
      };
     "custom/notification" ={
    	format = "󱅫";
    	on-click = "swaync-client -t -sw";
    };
    }];
  };
};
}
