# RailsBridge VM provision script (cleanup part)

# Tell the shell to print commands before running them
set -v

# Remove provision files
rm -rf /tmp/provision-files

# Remove downloaded Ruby source
rm -rf /usr/local/src/ruby-*
rm -rf /usr/local/src/chruby-*

# Remove wget kludge
rm -f $HOME/.wgetrc

# Clean up APT cache and zero out disk to reduce image size
apt-get clean
dd if=/dev/zero of=/EMPTY bs=1M
rm /EMPTY
