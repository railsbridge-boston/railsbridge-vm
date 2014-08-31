# RailsBridge VM provision script (user part)
. /tmp/railsbridge-versions.sh

# Put the right `gem` in our PATH (do this before turning on -v)
. /usr/local/share/chruby/chruby.sh
chruby "ruby-$RAILSBRIDGE_RUBY_VERSION"

# Tell the shell to print commands before running them
set -v

# Copy files that should be owned by the user account
rsync -rtv /vagrant/dotfiles/ /home/vagrant
echo "chruby ruby-$RAILSBRIDGE_RUBY_VERSION" >> /home/vagrant/.bash_profile

# Our bash setup will cd to workspace on login.
ln -s /vagrant $HOME/workspace

# Install gems
gem install rails --version "$RAILSBRIDGE_RAILS_VERSION"
# Keep this until the curriculum is updated to no longer use attr_accessible
gem install protected_attributes
