# RailsBridge VM provision script
. /tmp/railsbridge-versions.sh

# Tell the shell to print commands before running them
set -v

# Remove configuration-management systems preinstalled in official Ubuntu images
apt-get -y remove --purge chef chef-zero puppet puppet-common landscape-client landscape-common
# And any dependencies
apt-get -y autoremove
# Get any security updates not in the base image
sudo apt-get update
sudo apt-get -y upgrade
# Other packages we need
sudo apt-get install -q -y git vim nodejs sqlite3 libsqlite3-dev

# Copy our files into place
rsync -rtv /vagrant/etcfiles/ /etc
rsync -rtv /vagrant/binfiles/ /usr/local/bin
# Force MOTD generation (will only work on 14.04)
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
