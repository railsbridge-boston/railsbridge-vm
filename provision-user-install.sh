# RailsBridge VM provision script (user part)
. /tmp/provision-files/versions.sh

# Put the right `gem` in our PATH (do this before turning on -v)
. /usr/local/share/chruby/chruby.sh
chruby "ruby-$RAILSBRIDGE_RUBY_VERSION"

# Tell the shell to print commands before running them
set -v

# Copy files that should be owned by the user account
rsync -rtv /tmp/provision-files/home/ubuntu/ /home/ubuntu/
echo "chruby ruby-$RAILSBRIDGE_RUBY_VERSION" >> /home/ubuntu/.bash_profile

# Install gems
gem install rails --version "$RAILSBRIDGE_RAILS_VERSION"

# Create a new app in order to prefetch default gems for `bundle install`
cd /tmp
rails new testapp
rm -rf testapp
