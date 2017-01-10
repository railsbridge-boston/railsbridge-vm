# RailsBridge VM provision script (cleanup part)

# Tell the shell to print commands before running them
set -v

# Remove provision files
rm -rf /tmp/provision-files

# Remove downloaded Ruby source
rm -rf /usr/local/src/ruby-*
rm -rf /usr/local/src/chruby-*

# Work around MOTD cruft from https://bugs.launchpad.net/ubuntu/+source/update-notifier/+bug/1563854
rm -f /var/lib/update-notifier/updates-available

# Clean up APT cache and zero out disk to reduce image size
apt-get clean
dd if=/dev/zero of=/EMPTY bs=1M
rm /EMPTY
