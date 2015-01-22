# Change these whenever the curriculum is updated.
RAILSBRIDGE_RUBY_VERSION='2.0'
RAILSBRIDGE_RAILS_VERSION='4.0.13'

# We use ruby-install to build Ruby. Before building the VM image, check
# https://github.com/postmodern/ruby-install/commits/master for the
# latest update to the checksums for the Ruby version defined above, and
# update the commit here. This is necessary because ruby-install is not
# tagged for each new Ruby release (the latest tag is currently 0.5.0).
RAILSBRIDGE_RUBY_INSTALL_REVISION='536dca4af4bb18f1f605356c2055a745b7bb3222'
# After Ruby is installed we use chruby to enable it for the Vagrant user.
# We can use a tag for this.
RAILSBRIDGE_CHRUBY_VERSION='0.3.9'
