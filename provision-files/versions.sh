# Change these whenever the curriculum is updated.
RAILSBRIDGE_RUBY_VERSION='2.3.3'
RAILSBRIDGE_RAILS_VERSION='4.2.7.1'

# We use ruby-install to build Ruby. Before building the VM image, check
# https://github.com/postmodern/ruby-install/commits/master to see if
# there is a tag with the Ruby version we want. If not, change this back
# to a revision.
RAILSBRIDGE_RUBY_INSTALL_VERSION='0.6.1'
# After Ruby is installed we use chruby to enable it for the Vagrant user.
# We can use a tag for this.
RAILSBRIDGE_CHRUBY_VERSION='0.3.9'
