DIRECTORIES = $(HOME)/.config/bspwm $(HOME)/.config/picom $(HOME)/.config/alacritty

all: install

install:
	@for dir in $(DIRECTORIES); do \
		mkdir -p "$dir"; \
	done

	@for src in \
		$(HOME)/bspwm/dotfiles/bspwmrc \
		$(HOME)/bspwm/dotfiles/sxhkdrc \
		$(HOME)/bspwm/dotfiles/picom.conf \
		$(HOME)/bspwm/dotfiles/alacritty.toml \
		$(HOME)/bspwm/dotfiles/.xsession; do \
		dest=$(HOME)/.config/bspwm; \
		[ "$src" = "$(HOME)/bspwm/dotfiles/alacritty.toml" ] && dest=$(HOME)/.config/alacritty; \
		[ -f "$src" ] && mv "$src" "$dest"; \
	done

	@for file in \
		$(HOME)/.config/bspwm/bspwmrc \
		$(HOME)/.xsession \
		$(HOME)/bspwm/scripts/*.sh \
		$(HOME)/bspwm/firefox/*.sh; do \
		chmod +x "$file"; \
	done

	@echo "Installing packages with Nix..."
	nix-shell nix/package.nix --run "echo 'Nix environment set up'"

	@echo -e "Additional packages for installation:\n1 | yay\n2 | cava\n3 | spotify\n4 | neofetch\n5 | openrgb\n6 | openjdk\n7 | gradle"

	@read -p "Enter package numbers for installation: " -a selected_additional_indices; \
	declare -A package_commands=( \
		[1]="git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm" \
		[2]="yay -S --noconfirm cava" \
		[3]="yay -S --noconfirm spotify" \
		[4]="sudo pacman -S --noconfirm neofetch" \
		[5]="yay -S --noconfirm openrgb" \
		[6]="sudo pacman -S jdk-openjdk" \
		[7]="sudo pacman -S gradle" \
	); \
	for index in ${selected_additional_indices[@]}; do \
		if [[ -n "${package_commands[$index]}" ]]; then \
			eval "${package_commands[$index]}"; \
		else \
			echo "Incorrect number: $index"; \
		fi; \
	done

	sudo pacman -S --noconfirm ly && systemctl enable ly.service

	@echo "Excellent. You can reboot system."

.PHONY: all install
