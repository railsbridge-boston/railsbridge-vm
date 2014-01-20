# RailsBridge Boston Virtual Machine

To workshop participants: this is the "behind the scenes" stuff that instructors use to create the virtual machine that you will use. You should install the virtual machine image file, not this code. Please follow [the instructions on the RailsBridge Boston site](http://www.railsbridgeboston.org/vm_setup) to set up your virtual machine.

To instructors and TAs: if you're interested in helping to maintain the VM, keep reading.

## Setup of the generated VM

The base box is Ubuntu 12.04 LTS.

The target Ruby version is 2.0, and Rails version is 4.0. We may need to explicitly specify these in the future.

We use `chruby` to build/install Ruby, and invoke it in the user's `.bash_profile` to set their `PATH`. It provides a version of `gem` that defaults to user installs.

Currently we are asking students to install VirtualBox 4.2.

## Building a fresh image

The Vagrantfile will allow you to rebuild the RailsBridge Boston VM from scratch. Run:

    vagrant up

The base box will be downloaded directly from Ubuntu if it hasn't already been added. Building Ruby takes a while, so get some coffee.

Then, to create an image file to distribute:

    vagrant package --output railsbridgevm.box

## What to edit in this repo

To keep things simple and easy for everyone to modify, we use a shell script provisioner. There are two scripts:

* `provision-root.sh` runs as root (installs packages/Ruby system-wide)
* `provision-user.sh` runs as the `vagrant` user (installs gems to home directory)

Files are copied into the VM from these directories:

* `binfiles` to `/usr/local/bin` (as root)
* `etcfiles` to `/etc` (as root)
* `dotfiles` to `/home/vagrant` (as the user)

## Tests

TODO: There should be some kind of automated test for the output (i.e. can you start the VM, log in, clone a test Rails app, and run it).
