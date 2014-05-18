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
ln -s /vagrant $HOME/workspace

# Install gems
gem install rails --version "$RAILSBRIDGE_RAILS_VERSION"
# TODO: decide if this is still needed; we did not use it May
gem install therubyracer
# Keep this until the curriculum is updated to no longer use attr_accessible
gem install protected_attributes
