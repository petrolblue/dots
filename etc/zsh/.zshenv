# xdg
export \
	XDG_DATA_HOME="$HOME/usr/local/share" \
	XDG_CONFIG_HOME="$HOME/etc/" \
	XDG_CACHE_HOME="$HOME/var"

# ez
var="${XDG_DATA_HOME:-$HOME/usr/local/share}"
etc="${XDG_CONFIG_HOME:-$HOME/etc}"
cch="${XDG_CACHE_HOME:-$HOME/usr/local/share}"

export \
	XRESOURCES="$etc/x/xres"

# path
export PATH=$PATH:"$HOME/bin/"
export PATH=$PATH:"$HOME/var/python/bin/"

# programs
export \
	TERM="foot" \
	TERMINAL="foot" \
	EDITOR="nvim" \
	READER="zathura" \
	VISUAL="$EDITOR" \
	BROWSER="firefox" \
	MANPAGER="less"

# settings
export \
	GNUPGHOME="$etc/gnupg" \
	CARGO_HOME="$var/cargo/" \
	WEECHAT_HOME="$etc/chat" \
	RUSTUP_HOME="$etc/rustup/" \
	FZF_DEFAULT_COMMAND='find .' \
	PYTHONUSERBASE="$var/python" \
	LESSHISTFILE="$etc/.lesshst" \
	AUDACITY_PATH="$var/audacity" \
	GTK2_RC_FILES="$etc/.gtkrc-2.0" \
	GIMP2_DIRECTORY="$etc/GIMP/2.10" \
	PULSE_COOKIE="$etc/pulse/cookie" \
	npm_config_userconfig="$etc/npm/npmrc"

export XCURSOR_THEME=phinger-cursors-light sway
export XCURSOR_SIZE=24
export MOZ_ENABLE_WAYLAND=1
