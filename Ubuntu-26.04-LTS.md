## 🔥🔥🔥 Purge Unnecessary Packages Without Losing ubuntu-desktop

**Steps:**

1. Remove snaps (commands or scripts)
2. Purge unwanted apps
3. Install apps of your choice
4. Run cleanup scripts or use BleachBit

### Purge Snaps (Step by Step Commands)

```bash
sudo snap list
systemctl stop snapd
systemctl disable snapd
# Remove individual snaps
sudo snap remove --purge firefox firmware-updater
sudo snap remove --purge gnome-42-2204 gtk-common-themes
sudo snap remove --purge snap-store snapd-desktop-integration bare
sudo snap remove --purge core22
sudo snap remove --purge snapd

# Clean up snap directories
sudo rm -Rf /var/cache/snapd/
rm -Rf ~/snap
sudo apt autoremove --purge
```

### Purge Accessibility & Internationalization Packages (390+47 MB freed)

```bash
# remove ubuntu-report & apport  apport-core-dump-handler  apport-gtk
sudo apt purge ubuntu-report apport  apport-core-dump-handler  apport-gtk
# Accessibility (117MB)
sudo apt purge brltty orca gnome-accessibility-themes fonts-noto-cjk
# blob errors, ignore (294MB)
sudo apt purge speech-dispatcher* libpinyin* ibus* pocketsphinx* espeak* liblouis* hplip*
# cleaning (37MB)
sudo apt autoremove --purge
```

### Remove Printing Support (19+5 MB freed)

```bash
sudo apt purge 'cups*' 'foomatic*' printer-driver-brlaser* printer-driver-foo2zjs-common* printer-driver-ptouch* printer-driver-c2esp* printer-driver-min12xxw* printer-driver-sag-gdi*
sudo apt autoremove --purge

## 🔥🔥🔥 Remove Old Kernels

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

## ✴️✴️✴️ Suggested / Optional Packages

### Essential Tools

```bash
# must have programs
sudo apt install nala
sudo nala install curl git gnome-shell-extension-manager gnome-tweaks synaptic transmission lsd nautilus-admin gedit gedit-plugins
```
# thunar file browser
```bash
sudo nala install thunar thunar-media-tags-plugin
```
# multimedia programs
```bash
sudo nala install gstreamer1.0-libav gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly
sudo nala install showtime 
sudo nala install gapless
sudo nala install vlc
sudo nala install amberol
sudo nala install gnome-video-trimmer
```
# Optional Programs
```bash
sudo nala install gnome-calendar
sudo nala install errands
sudo nala install wike
sudo nala install adb fastboot
sudo nala install file-roller rar unrar
sudo nala install gnome-decoder
sudo nala install wordbook
```
