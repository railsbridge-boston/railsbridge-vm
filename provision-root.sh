# RailsBridge Boston VM provision script

# Before doing anything else, copy our files into place.
rsync -rtv /vagrant/etcfiles/ /etc
rsync -rtv /vagrant/binfiles/ /usr/local/bin

# Get all necessary packages
sudo apt-get update
sudo apt-get install -q -y git vim nodejs sqlite3 libsqlite3-dev build-essential

# Ruby
cd /tmp
curl -L https://github.com/postmodern/chruby/archive/v0.3.7.tar.gz | tar xzv
cd chruby-0.3.7
# FIXME: ugly hack to avoid spending 30min building JRuby/Rubinius and bulking up the image with their dependencies
sed -i~ -e 's!^./setup.sh$!make install; ruby-install ruby!' ./scripts/setup.sh
./scripts/setup.sh
cd ..

# Heroku Toolbelt is a .deb package, so install as root.
curl -L https://toolbelt.heroku.com/install-ubuntu.sh | sh

# Clean up APT cache and zero out disk to reduce image size
apt-get clean
dd if=/dev/zero of=/EMPTY bs=1M
rm /EMPTY
