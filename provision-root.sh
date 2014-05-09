# RailsBridge VM provision script

RAILSBRIDGE_RUBY_VERSION='2.0'

# Ubuntu images now include things we don't want
apt-get -y remove --purge chef chef-zero puppet puppet-common landscape-client landscape-common
apt-get -y autoremove

# Get any security updates not in the base image
sudo apt-get update
sudo apt-get -y upgrade

# Before doing anything else, copy our files into place.
rsync -rtv /vagrant/etcfiles/ /etc
rsync -rtv /vagrant/binfiles/ /usr/local/bin

# Other packages we need
sudo apt-get install -q -y git vim nodejs sqlite3 libsqlite3-dev

# Ruby (our fork of chruby will not automatically build all rubies)
cd /tmp
curl -L https://github.com/railsbridge-boston/chruby/archive/v0.3.8.rbb201405.3.tar.gz | tar xzv
(cd chruby-0.3.8.rbb201405.3 && ./scripts/setup.sh)
ruby-install ruby "$RAILSBRIDGE_RUBY_VERSION" -- --disable-install-rdoc

# Heroku Toolbelt is a .deb package, so install as root.
curl -L https://toolbelt.heroku.com/install-ubuntu.sh | sh

# Clean up APT cache and zero out disk to reduce image size
apt-get clean
dd if=/dev/zero of=/EMPTY bs=1M
rm /EMPTY
