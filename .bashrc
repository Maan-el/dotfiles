# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc


# user stuff


## Colors for terminal prompt
#
# Black       0;30     Dark Gray     1;30
# Blue        0;34     Light Blue    1;34
# Green       0;32     Light Green   1;32
# Cyan        0;36     Light Cyan    1;36
# Red         0;31     Light Red     1;31
# Purple      0;35     Light Purple  1;35
# Brown       0;33     Yellow        1;33
# Light Gray  0;37     White         1;37
PS1="\[\033[1;35m\][\$(date +%H'h:'%M)][\u@\h: \w]$\[\033[0m\] "

upd () {
	sudo dnf update
	#sudo snap refresh
	flatpak uninstall --unused
	flatpak update
}

alias vim="nvim"
alias cpodium="flatpak run com.vscodium.codium "
export EDITOR="nvim"
alias inst="sudo dnf install"
alias unst="sudo dnf remove"

export PATH="$HOME/.emacs.d/bin:$PATH"

export GTK_USE_PORTAL=1

