# Maintainer: Aditya Shakya <adi1090x@gmail.com>

pkgname=archcraft-fluxbox
pkgver=1.0
pkgrel=1
pkgdesc="Fluxbox Configurations for Archcraft"
url="https://github.com/archcraft-os/archcraft-fluxbox"
arch=('any')
license=('GPL3')
makedepends=('git')
depends=('fluxbox'
		'alacritty' 'thunar' 'geany'
		'rofi' 'dunst'
		'mpd' 'mpc'
		'maim' 'xclip' 'viewnior'
		'ksuperkey' 
		'betterlockscreen'
		'picom-ibhagwan-git' 
		'xfce-polkit' 
		'xfce4-power-manager' 
		'hsetroot'
		'acpi'
		'networkmanager')
conflicts=()
provides=("${pkgname}")
options=(!strip !emptydirs)
install="${pkgname}.install"

prepare() {
	cp -af ../files/. ${srcdir}
}

package() {
	local _config=${pkgdir}/etc/skel/.fluxbox
	mkdir -p "$_config"

	# Copy i3wm config files
	cp -r ${srcdir}/alacritty 		"$_config"
	cp -r ${srcdir}/backgrounds 	"$_config"
	cp -r ${srcdir}/bin 			"$_config"
	cp -r ${srcdir}/rofi 			"$_config"
	cp -r ${srcdir}/styles 			"$_config"

	chmod +x "$_config"/bin/*
	chmod +x "$_config"/rofi/bin/*

	install -Dm 644 apps   			"$_config"/apps
	install -Dm 644 init   			"$_config"/init
	install -Dm 644 keys   			"$_config"/keys
	install -Dm 644 menu   			"$_config"/menu
	install -Dm 644 windowmenu   	"$_config"/windowmenu
	install -Dm 644 dunstrc   		"$_config"/dunstrc
	install -Dm 644 picom.conf   	"$_config"/picom.conf
	install -Dm 755 startup   		"$_config"/startup
}
