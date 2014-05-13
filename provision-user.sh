# RailsBridge VM provision script (user part)

# Set versions here
RAILSBRIDGE_RAILS_VERSION='4.0.5'

# Put the right `gem` in our PATH (do this before turning on -v)
. /usr/local/share/chruby/chruby.sh
chruby ruby-2.0

# Tell the shell to print commands before running them
set -v

# Copy files that should be owned by the user account
rsync -rtv /vagrant/dotfiles/ /home/vagrant

# Our bash setup will cd to workspace on login.
cd /home/vagrant
ln -s /vagrant workspace

# Install gems
gem install rails --version "$RAILSBRIDGE_RAILS_VERSION"
gem install therubyracer
