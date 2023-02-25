#!/bin/bash

fwupdmgr get-updates
fwupdmgr get-upgrades

sudo grubby --update-kernel=ALL --remove-args="amd_pstate.shared_mem=1"
sudo grubby --update-kernel=ALL --args="amd_pstate=passive"

programas_dnf=(
	# Games/Media
	"wine"
	"lutris"
	"steam"
	"qbittorrent"
	"vlc"
	## waydroid deixa o login _extremamente_ lento
	#"waydroid"
	"ffmpeg"
	# Gnome mods
	"gnome-tweaks"
	"gnome-extensions-app"
	"papirus-icon-theme"
	"gnome-shell-extension-gsconnect"
	"webextension-gsconnect"
	"nautilus-gsconnect"
	# OS tools
	#"snapd"
	"java-17-openjdk"
	"shellcheck"
	"unrar"
	"openssl"
	"openssh"
	"rsync"
	"neovim"
	"tree"
	"tealdeer"
	"fd-find"
	"ripgrep"
	"yt-dlp"
	"neofetch"
	"flatseal"
	"google-noto-*"
	"powertop"
	"gparted"
	"mesa-va-drivers-freeworld"
	# Dev tools
	"emacs"
	"discount"
	"rust-analyzer"
	"npm"
	"sbcl"
	"racket"
	"java-17-openjdk-devel"
	"shfmt"
	"shellcheck"
	"glslang"
	"virt-manager"
	"rust"
	"cargo"
	"pip"
	"lldb"
	"clang-tools-extra"
	"java-1.8.0-openjdk"
	"binutils-riscv64-linux-gnu"
	"gcc-c++-riscv64-linux-gnu"
	"gcc-riscv64-linux-gnu"
	"qemu-user-static-riscv"
)

programas_flat=(
	"com.discordapp.Discord"
	"com.spotify.Client"
	"com.mojang.Minecraft"
	"com.github.qarmin.czkawka"
	"com.vscodium.codium"
)

programas_pip=(
	"gallery-dl"
)

programas_snap=(
	"bitwarden"
)

dnf_repos=(
	"https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
	"https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
)

flatpak_repos=(
	"flathub https://flathub.org/repo/flathub.flatpakrepo"
)

gnome_extensions=(
	"https://extensions.gnome.org/extension/615/appindicator-support/"
	"https://extensions.gnome.org/extension/5338/aylurs-widgets/"
	"https://extensions.gnome.org/extension/19/user-themes/"
	"https://extensions.gnome.org/extension/7/removable-drive-menu/"
	"https://extensions.gnome.org/extension/3193/blur-my-shell/"
)

sudo dnf update -y
firefox "${gnome_extensions[@]}"

sudo dnf install -y "${dnf_repos[@]}"
sudo dnf update -y
sudo dnf install -y "${programas_dnf[@]}"

#sudo snap install -y ${programas_snap[@]}

flatpak remote-add --if-not-exists "${flatpak_repos[@]}"
flatpak install flathub "${programas_flat[@]}"

flatpak override --user com.vscodium.codium --no-talk-name=org.freedesktop.Flatpak

pip install --user "${programas_pip[@]}"

mv ~/.bashrc ~/.bashrc.bak
mv ~/.bash_profile ~/.bash_profile.bak
ln -s ~/.dotfiles/.bashrc ~/.bashrc
ln -s ~/.dotfiles/bash_profile ~/.bash_profile

# Good old Doom Emacs
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
~/.emacs.d/bin/doom install

# Permite uso constante da memória comprimida
echo "vm.swappiness = 150" >>/etc/sysctl.conf
