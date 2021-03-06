#!/bin/bash

set -ue
###############################################################
# Local functions

# Install packages that not in pacman repository
install_packages()
{
    # install nvm
    printf "%s\n" \
	   "install nvm"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | sh
}
restore_packages()
{
    sudo pacman -S --needed - < pkglist
}

backup_packages()
{
    sudo pacman -Qqen > pkglist
}

generate_gitconfig()
{
    printf "%s\n" \
           "Generate Git Config ..."
    printf "%s\n" \
           "Type your github author name:"
    read -e git_authorname
    printf "%s\n" \
	   "Type your github author email:"
    read -e git_authoremail
    git config --global user.name $git_authorname
    git config --global user.email $git_authoremail
    git config --global core.editor emacs
}

create_symlink()
{
    sudo pacman -S --needed stow
    stow --dotfiles emacs
    stow --dotfiles bash
}
usage()
{
    printf "%s\n" \
	   "-r, --restore   Install packages in pkglist file"

    printf "%s\n" \
	   "-b, --backup    Backup installed by pacman packages to pkglist file"

    printf "%s\n" \
	   "-s, --symlink   Create symlink of configuration by GNU Stow"

    printf "%s\n" \
	   "-i, --install   Install packages that not in pacman repository"

    printf "%s\n" \
	   "-g, --git       Generate git config"

    printf "%s\n" \
	   "-h, --help      Display this really usefull message"
}

###############################################################
# Command line options

if [ "$#" -eq 0 ]; then
    printf "%s\\n" "Argument required"
    printf "%s\\n" "Try --help or -h for more information."
    exit 1
fi

while [ "$#" -gt 0 ] ; do
    case "$1" in
	-r | --restore)
	    restore_packages
	    shift
	    ;;
	-b | --backup)
	    backup_packages
	    shift
	    ;;
	-s | --symlink)
	    create_symlink
	    shift
	    ;;
	-i | --install)
	    install_packages
	    shift
	    ;;
	-g | --git)
	    generate_gitconfig
	    shift
	    ;;
	-h | --help)
	    usage
	    shift
	    ;;
	*)
	    usage
	    printf "\\n%s\\n" "Invalid option '$1'"
	    exit 1
	    ;;
	esac
done
