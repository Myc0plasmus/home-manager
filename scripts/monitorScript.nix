{pkgs}:

pkgs.writeShellScriptBin "monitorScript" ''
	if ${pkgs.xrandr}/bin/xrandr --query | grep "HDMI-1 connected"
	then
		${pkgs.xrandr}/bin/xrandr --output HDMI-1 --auto --above eDP-1
	else
		${pkgs.xrandr}/bin/xrandr --output HDMI-1 --off
	fi
''
