{ config, pkgs, ... }: {
  config = {
    home.packages = with pkgs; [ material-design-icons nerdfonts ];
    programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = ''
      ${builtins.readFile "${pkgs.waybar}/etc/xdg/waybar/style.css"}
        * {
        	font-family: 'M+1Code Nerd Font';
        	font-size: 16px;
        	min-height: 30px;
        }

        window#waybar {
        	background: transparent;
        }

        #workspaces {
        	background-color: transparent;
        	color: #0d74bd;
        	margin-top: 15px;
        	margin-right: 15px;
        	padding-top: 1px;
        	padding-left: 10px;
        	padding-right: 10px;
        }

        #custom-nix {
        	background-color: transparent;
        	color: #0a60ab;
        	margin-top: 15px;
        	margin-right: 15px;
        	padding-top: 1px;
        	padding-left: 10px;
        	padding-right: 10px;
        }

        #custom-nix {
        	font-size: 20px;
        	margin-left: 15px;
        	color: #0a60ab;
        }

        #workspaces button {
        	background: transparent;
        	color: #0d74bd;
        }

        #cpu, #memory, #temperature, #disk, #clock, #backlight, #pulseaudio, #bluetooth, #network, #battery, #custom-power {
        	background-color: transparent;
        	color: #00ba69;
        	margin-top: 15px;
        	padding-left: 10px;
        	padding-right: 10px;
        	margin-right: 15px;
        }

        #cpu {
        	color: #FFD700;
        }

        #memory {
        	color: #008000;
        }

        #disk {
        	color: #A8A8A8;

        }

        #backlight, #bluetooth {
        	color: #0056A3;
        	padding-right: 5px;
        	margin-right: 0
        }

        #network {
        	color: #10a140;
        	padding-left: 5px;
        }

        #pulseaudio {
        	color: #ba23d9;
        	padding-left: 5px;
        }

        #clock {
        	color: #00ba69;
        }
      window#waybar {
        background: transparent;
        border-bottom: none;
      }
    '';
    settings = [{
      height = 30;
      layer = "top";
      position = "bottom";
      tray = { spacing = 10; };
      modules-center = [ "hyprland/window" ];
      modules-left = [ "hyprland/workspaces" "hyprland/mode" ];
      modules-right = [
        "pulseaudio"
        "network"
        "cpu"
        "memory"
        "custom/water_temperature"
        "clock"
        "tray"
      ];
      "custom/water_temperature" = {
        critical-threshold = 36;
        format = "{}°C {}";
	interval = 1;
	exec= "$HOME/scripts/water_temp.sh";
      };
      clock = {
        format-alt = "{:%Y-%m-%d}";
        tooltip-format = "{:%Y-%m-%d | %H:%M}";
      };
      cpu = {
        format = "{usage}% ";
        tooltip = false;
      };
      memory = { format = "{}% "; };
      network = {
        interval = 1;
        format-alt = "{ifname}: {ipaddr}/{cidr}";
        format-disconnected = "Disconnected ⚠";
        format-ethernet = "{ifname}: {ipaddr}/{cidr} 󰈀  up: {bandwidthUpBits} down: {bandwidthDownBits}";
        format-linked = "{ifname} (No IP) ";
        format-wifi = "{essid} ({signalStrength}%) ";
      };
      pulseaudio = {
        format = "{volume}% {icon} {format_source}";
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
        format-muted = " {format_source}";
        format-source = "{volume}% ";
        format-source-muted = "";
        on-click = "pavucontrol";
      };
      temperature = {
        critical-threshold = 80;
        format = "{temperatureC}°C {icon}";
        format-icons = [ "" "" "" ];
      };
    }];
  };
};
}
