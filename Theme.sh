#!/usr/bin/env bash
#   █████╗ ██╗     ██╗███╗   ██╗███████╗    ██████╗ ██╗ ██████╗███████╗
#  ██╔══██╗██║     ██║████╗  ██║██╔════╝    ██╔══██╗██║██╔════╝██╔════╝
#  ███████║██║     ██║██╔██╗ ██║█████╗      ██████╔╝██║██║     █████╗
#  ██╔══██║██║     ██║██║╚██╗██║██╔══╝      ██╔══██╗██║██║     ██╔══╝
#  ██║  ██║███████╗██║██║ ╚████║███████╗    ██║  ██║██║╚██████╗███████╗
#  ╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═══╝╚══════╝    ╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝
#  Author  :  z0mbi3
#  Url     :  https://github.com/gh0stzk/dotfiles
#  About   :  This file will configure and launch the rice.
#

# Set bspwm configuration for Aline
set_bspwm_config() {
	bspc config border_width 0
	bspc config top_padding 57
	bspc config bottom_padding 2
	bspc config left_padding 2
	bspc config right_padding 2
	bspc config normal_border_color "#6e6a86"
	bspc config active_border_color "#907aa9"
	bspc config focused_border_color "#56949f"
	bspc config presel_feedback_color "#d7827e"
}

# Set alacritty colorscheme
set_alacritty_config() {
	cat >"$HOME"/.config/alacritty/rice-colors.toml <<EOF
# (Rose Pine Dawn) color scheme for Aline Rice
# Colors (Challenger Deep)

# Default colors
[colors.primary]
background = '#1e1c31'
foreground = '#cbe1e7'

[colors.cursor]
text = '#ff271d'
cursor = '#fbfcfc'

# Normal colors
[colors.normal]
black   = '#141228'
red     = '#ff5458'
green   = '#62d196'
yellow  = '#ffb378'
blue    = '#65b2ff'
magenta = '#906cff'
cyan    = '#63f2f1'
white   = '#a6b3cc'

# Bright colors
[colors.bright]
black   = '#565575'
red     = '#ff8080'
green   = '#95ffa4'
yellow  = '#ffe9aa'
blue    = '#91ddff'
magenta = '#c991e1'
cyan    = '#aaffe4'
white   = '#cbe3e7'
EOF
}

# Set kitty colorscheme
set_kitty_config() {
  cat >"$HOME"/.config/kitty/current-theme.conf <<EOF
## This file is autogenerated, do not edit it, instead edit the Theme.sh file inside the rice directory.
## (Challenger deep) color scheme for Aline Rice

foreground   #cbe3e7
background   #1e1c31
selection_foreground #1e1c31
selection_background #aaffe4

active_tab_background   #565575
inactive_tab_background #565575
active_tab_foreground #95ffa4
inactive_tab_foreground #cbe3e7

active_border_color #fbfcfc

color0       #565575
color8       #100e23

color1       #ff8080
color9       #ff5458

color2       #95ffa4
color10      #62d196

color3       #ffe9aa
color11      #ffb378

color4       #91ddff
color12      #65b2ff

color5       #c991e1
color13      #906cff

color6       #aaffe4
color14      #63f2f1

color7       #cbe3e7
color15      #a6b3cc

EOF

killall -USR1 kitty
}

# Set compositor configuration
set_picom_config() {
	sed -i "$HOME"/.config/bspwm/picom.conf \
		-e "s/normal = .*/normal =  { fade = true; shadow = true; }/g" \
		-e "s/shadow-color = .*/shadow-color = \"#000000\"/g" \
		-e "s/corner-radius = .*/corner-radius = 6/g" \
		-e "s/\".*:class_g = 'Alacritty'\"/\"100:class_g = 'Alacritty'\"/g" \
		-e "s/\".*:class_g = 'kitty'\"/\"100:class_g = 'kitty'\"/g" \
		-e "s/\".*:class_g = 'FloaTerm'\"/\"100:class_g = 'FloaTerm'\"/g"
}

# Set dunst notification daemon config
set_dunst_config() {
	sed -i "$HOME"/.config/bspwm/dunstrc \
		-e "s/transparency = .*/transparency = 3/g" \
		-e "s/frame_color = .*/frame_color = \"#1e1c31\"/g" \
		-e "s/separator_color = .*/separator_color = \"#907aa9\"/g" \
		-e "s/font = .*/font = JetBrainsMono NF Medium 9/g" \
		-e "s/foreground='.*'/foreground='#575279'/g"

	sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
	cat >>"$HOME"/.config/bspwm/dunstrc <<-_EOF_
		[urgency_low]
		timeout = 3
		background = "#1e1c31"
		foreground = "#51576d"

		[urgency_normal]
		timeout = 6
		background = "#1e1c31"
		foreground = "#51576d"

		[urgency_critical]
		timeout = 0
		background = "#1e1c31 "
		foreground = "#51576d"
	_EOF_
}

# Set eww colors
set_eww_colors() {
	cat >"$HOME"/.config/bspwm/eww/colors.scss <<EOF
// Eww colors for Aline rice
\$bg: #faf4ed;
\$bg-alt: #f2e9e1;
\$fg: #575279;
\$black: #9893a5;
\$lightblack: #262831;
\$red: #b4637a;
\$blue: #56949f;
\$cyan: #d7827e;
\$magenta: #907aa9;
\$green: #286983;
\$yellow: #ea9d34;
\$archicon: #0f94d2;
EOF
}

# Set jgmenu colors for Aline
set_jgmenu_colors() {
	sed -i "$HOME"/.config/bspwm/jgmenurc \
		-e 's/color_menu_bg = .*/color_menu_bg = #faf4ed/' \
		-e 's/color_norm_fg = .*/color_norm_fg = #575279/' \
		-e 's/color_sel_bg = .*/color_sel_bg = #f2e9e1/' \
		-e 's/color_sel_fg = .*/color_sel_fg = #575279/' \
		-e 's/color_sep_fg = .*/color_sep_fg = #907aa9/'
}

# Set rofi colors
set_launcher_config() {
	cat >"$HOME"/.config/bspwm/src/rofi-themes/shared.rasi <<EOF
// Rofi colors for Aline

* {
    font: "JetBrainsMono NF Bold 9";
    background: #1e1c31;
    background-alt: #141228;
    foreground: #cbe3e7;
    selected: #d7827e;
    active: #286983;
    urgent: #ea9d34;
    
    img-background: url("~/.config/bspwm/rices/aline/rofi.webp", width);
}
EOF
}

# Launch the bar
launch_bars() {

	for mon in $(polybar --list-monitors | cut -d":" -f1); do
		MONITOR=$mon polybar -q aline-bar -c "${rice_dir}"/config.ini &
	done

}

### ---------- Apply Configurations ---------- ###

set_bspwm_config
set_alacritty_config
set_kitty_config
set_picom_config
set_dunst_config
set_eww_colors
set_jgmenu_colors
set_launcher_config
launch_bars
