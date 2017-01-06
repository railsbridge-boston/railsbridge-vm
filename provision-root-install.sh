# RailsBridge VM provision script
. /tmp/provision-files/versions.sh

# Tell the shell to print commands before running them
set -v

# Remove Ubuntu stuff we don't want
apt-get -y remove --purge snapd ubuntu-core-launcher ubuntu-release-upgrader-core
# Clean up dependencies of those
apt-get -y autoremove

# Get any security updates not in the base image
apt-get update
apt-get -y upgrade
# Other packages we need
apt-get install -q -y make nodejs sqlite3 libsqlite3-dev

# Copy our files into place
rsync -rtv /tmp/provision-files/etc/ /etc/
rsync -rtv /tmp/provision-files/usr/local/bin/ /usr/local/bin/
# Force MOTD generation
rm -f /etc/update-motd.d/51-cloudguest
run-parts --lsbsysinit /etc/update-motd.d > /run/motd.dynamic

# Do all source installation from this dir, which we'll clean up in another script
mkdir -p /usr/local/src && cd /usr/local/src
# Install chruby
curl -s -L "https://github.com/postmodern/chruby/archive/v$RAILSBRIDGE_CHRUBY_VERSION.tar.gz" | tar xzv
(cd "chruby-$RAILSBRIDGE_CHRUBY_VERSION" && ./scripts/setup.sh)
# Install ruby-install
curl -s -L "https://github.com/postmodern/ruby-install/archive/v$RAILSBRIDGE_RUBY_INSTALL_VERSION.tar.gz" | tar xzv
(cd "ruby-install-$RAILSBRIDGE_RUBY_INSTALL_VERSION" && make install)
# Build Ruby
ruby-install ruby "$RAILSBRIDGE_RUBY_VERSION" -- --disable-install-rdoc
