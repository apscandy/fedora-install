
# https://docs.clamav.net/manual/Installing/Packages.html
dnf install -y clamav clamd clamav-update

# https://usbguard.github.io/documentation/compilation.html
sudo yum install yum-plugin-copr
sudo yum copr enable mildew/usbguard
sudo yum install usbguard
sudo yum install usbguard-applet-qt
