# RailsBridge Boston VM provision script (user part)

RAILSBRIDGE_RAILS_VERSION='4.0.5'

# Copy files that should be owned by the user account
rsync -rtv /vagrant/dotfiles/ /home/vagrant

# Our bash setup will cd to workspace on login.
cd /home/vagrant
ln -s /vagrant workspace

# This is ugly, but we need to run the right gem
. .bash_profile

# Install gems
gem install rails --version "$RAILSBRIDGE_RAILS_VERSION"
gem install therubyracer
