# RailsBridge VM provision script (cleanup part)

# Tell the shell to print commands before running them
set -v

# Clean up APT cache and zero out disk to reduce image size
apt-get clean
dd if=/dev/zero of=/EMPTY bs=1M
rm /EMPTY
