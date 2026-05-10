# 🆕🆒🆓 Clean & Minimal Ubuntu

When installing Ubuntu, choose **DEFAULT SELECTION** (Just the essentials, web browser and basic utilities). All of the below removal and installation is to make Ubuntu more suitable for development.

**bash_aliases** _commands aliases for git & pnpm_

**install-mise-help.md** _commands & setups for mise_

**install-nodejs-help.md** _commands & setups for nodejs_

**install-windows11-help.md** _commands for Windows 10/11 after clean installation_

**remove locales.md** _Remove languages other than english from Chrome & electron-based apps. more than 45+ MB space is saved by these commands_

### useful commands to remember

```bash
# check your Ubuntu version
lsb_release -a
# Displays system hostname and key system information
hostnamectl
# Show Size and Sort by Largest (Most Useful)
du -h -s * | sort -h -r
```
### Export/Load settings

```bash
# This removes all user-configured GNOME desktop settings.
dconf reset -f /
# export/load GNOME desktop settings.
dconf dump / > full-gnome-backup-2026-05-10.conf
dconf load / < full-gnome-backup-2026-05-10.conf
# export/load GNOME desktop extensions settings.
dconf dump /org/gnome/shell/extensions/ > aa-gnome-exts-settings.conf
dconf load /org/gnome/shell/extensions/ < aa-gnome-exts-settings.conf
```



## ⭐⭐⭐ First: Update & Upgrade

```bash
sudo apt update
sudo apt install nala
sudo nala full-upgrade

sudo apt update -y && sudo apt upgrade -y
apt search <keyword>
sudo apt --fix-broken install
sudo apt autoremove --purge
sudo apt autopurge
```

### Configure **nala**

edit this file `sudo nano /etc/nala/nala.conf`:

```bash
# Set to true for `MiB` false for `MB`
filesize_binary = true
```

---

### Remove Old Kernels

First, identify installed kernels: Then remove specific versions:

```bash
dpkg --list | grep -Ei 'linux-image|linux-headers|linux-tools|linux-modules|linux-hwe'

dpkg --list | grep -i linux-image
dpkg --list | grep -i linux-headers
dpkg --list | grep -i linux-tools
dpkg --list | grep -i linux-modules
dpkg --list | grep -i linux-hwe
sudo dpkg --purge package1 package2 package3 ...
sudo apt purge package1 package2 package3 ...
sudo apt autopurge
sudo update-grub
```

## 🌐🌐🌐 Install Latest Google Chrome

```bash
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
```

---

## 🆘🆘🆘 oh-my-posh Setup

### Installation

```bash
sudo bash -c "$(curl -s https://ohmyposh.dev/install.sh)" -- -d /usr/bin

# move themes directory
sudo mv /root/.cache/oh-my-posh/themes/ ~/.oh-my-posh
sudo chmod 777 .oh-my-posh/

# Refresh bash after changes
exec bash
```

### Files in oh-my-posh backups

## FOLDERS

**[omp]**
customized oh-my-posh themes

**[WindowsPowerShell]**
configuration file in Documents folder for MS Windows

## FILES

**[themes-oh-my-posh.txt]**
simple paths for themes in ~/.oh-my-posh

**[24-04.bashrc]**
customized .bashrc of ubuntu 24.04 with oh-my-posh themes commented at the end
**[]**

### Configure Bash

You can use the enclosed .bashrc for the selection of themes, just uncomment the required theme. Refresh bash after selecting theme:

---

## 🛸💽🚚 XTRADEB Packages

Unofficial Ubuntu application packages maintained by xtradeb. in ungoogled-chromium extensions can not be installed, so i prefer mostly chromium.

[xtradeb PPA](https://launchpad.net/~xtradeb/+archive/ubuntu/apps)

```bash
sudo add-apt-repository ppa:xtradeb/apps -y
sudo nala update
sudo nala install yt-dlp parabolic calibre ungoogled-chromium chromium gnucash intellij-idea-community pycharm-community
```

---

## 📦📦📦 Git & SSH Setup

This setup is recommended if you have only single git account, for multiple git accounts, a complex setup is required.

### Git Configuration

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
git config --global color.ui auto
git config --global core.editor "code --wait"


# use diff-so-fancy and bat to make things look better
git config --global core.pager "diff-so-fancy | bat -p"
git config --global interactive.diffFilter "diff-so-fancy --patch"\n

# useful for cases of multiple remotes
git config --global alias.pushall "\!git remote | xargs -L1 git push --all"

# kill the enabled-by-default branch pager (why was this a thing?)
git config --global pager.branch false
```

### SSH Setup

#### ✅ 1. Check for Existing SSH Keys

```bash
ls -al ~/.ssh
mkdir .ssh
cd .ssh
```

If keys exist, proceed to steps 3 & 6.

#### ✅ 2. Generate a New SSH Key (if none exist)

```bash
ssh-keygen -t ed25519 -C "your.email@example.com"
```

#### ✅ 3. Add SSH Key to SSH Agent

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

#### ✅ 4. Copy the Public Key

```bash
cat ~/.ssh/id_ed25519.pub
```

#### Fix Permissions (if needed)

```bash
chmod 600 ~/.ssh/id_ed25519
```

#### ✅ 5. Add SSH Key to GitHub

Add the public key from step 4 to your GitHub account settings.

#### ✅ 6. Test the GitHub Connection

```bash
rm ~/.ssh/known_hosts
ssh-keyscan github.com >> ~/.ssh/known_hosts
ssh -T git@github.com
```

---

## 🪛📜💻 Important in Scripts folder

**[ubuntu-debullshit.sh](https://github.com/polkaulfield/ubuntu-debullshit)**
Purges snaps, installs flatpaks, and restores vanilla GNOME.

**[snap-remover.sh](https://gist.github.com/lassekongo83/808b19e034c05d10ac4e3cc259808e4e)**
Completely remove snaps from Ubuntu.

**[snap-cleaner.sh](https://github.com/sakibulalikhan/snap-cleaner)**
Free up disk space by deleting unnecessary Snap package revisions and caches.

**[ubuntu_cleanup.sh](https://gist.github.com/Limbicnation/6763b69ab6a406790f3b7d4b56a2f6e8)**
A comprehensive system cleanup script that safely removes unnecessary files to free up disk space.
