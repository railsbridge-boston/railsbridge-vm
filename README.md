# RailsBridge Virtual Machine

If you just want the VM image, **downloads are here**: http://downloads.railsbridge.org/

To workshop participants: this is the "behind the scenes" stuff that instructors use to create the virtual machine that you will use. You should install the virtual machine image file, not this code. Please follow [the instructions on the RailsBridge Boston site](http://docs.railsbridgeboston.org/installfest/) to set up your virtual machine.

To instructors and TAs: if you're interested in helping to maintain the VM, keep reading.

## Setup of the generated VM

The base box is Ubuntu 16.04 LTS; Ubuntu distributes version 5.0 of the VirtualBox guest additions. We should have students install the same version of the VirtualBox host.

The target versions are Ruby 2.2 and Rails 4.2 (the latest patchlevels available at build time). These are set in `provision-files/versions.sh`, which is used by the provisioning scripts.

If you want to run a workshop with Rails 3, there is a `rails3` branch (Ruby 1.9.3, Rails 3.2). It may be less up to date so check if there have been any security updates to Rails 3 before building it.

We use `chruby` to build/install Ruby, and invoke it in the user's `.bash_profile` to set their `PATH`. It provides a version of `gem` that defaults to user installs.

## Building a fresh image

There are a few simple Rake tasks to help you rebuild the image from scratch. Run:

    rake up

This will update the base box if you've downloaded it previously, then run `vagrant up` to provision the VM. (If you haven't downloaded the base box, Vagrant will fetch it automatically.)

Don't worry about the red text (Vagrant automatically colors all text printed to standard error). Building Ruby takes a while, so get some coffee.

When the provision finishes, run this to create an image file to distribute:

    rake package

This will output an image file name `railsbridgevm-version.box`, where the `version` is based on the tag you have checked out.

Finally, when you're ready to make a change and build again, run:

    rake cleanup

To halt and destroy the VM, so that the next `vagrant up` run has to re-provision it.

When you are ready to make the "gold master" version that we will ask students to download, create (and push to GitHub) a tag with the year and month of the workshop (e.g. `2014-01`) before running `rake package`. During the process of testing an image, you can run `rake package` with an untagged commit; the version will then include its SHA and how many commits it is ahead of the last tag.

## What to edit in this repo

To keep things simple and easy for everyone to modify, we use a shell script provisioner. There are three scripts:

* `provision-root-install.sh` runs as root (installs packages/Ruby system-wide)
* `provision-user-install.sh` runs as the `ubuntu` user (installs gems to home directory)
* `provision-root-cleanup.sh` runs as root (removes files and zeroes out disk)

We also run the Heroku Toolbelt install script directly as root.

Files are copied into the VM from the `provision-files` directory (`/usr/local/bin` and `/etc` as root, `/home/ubuntu` as the user account).

## Rebuilding changes

If you make changes to the provisioning scripts, you should rebuild the VM from a clean image to ensure that everything is reproducible and that no manual changes have snuck in. To do this, run `vagrant destroy` and then `vagrant up` again.

It will re-run everything again, so grab some more coffee.

## Using the VM

There are a few extra scripts in the VM that you can use during the workshop:

* `railsbridge-update-dotfiles` will download and re-install all dotfiles from this repo (useful if they are mistakenly edited or deleted).
* `railsbridge-color off` will disable coloring of shell and IRB prompts (log out and back in to see the change). To re-enable color, run `railsbridge-color on`.
* `showargs` can be used to explain how command-line arguments work.
* `vagrant` prints a message explaining that you're in the VM and should exit if you want to run a Vagrant command.

## Additional Files

Some files are not installed in the VM:

* `vm.rb`: this is a Rails application template that students can apply to their app so that they don't have to pass `-b 0.0.0.0` to `rails server`. Copy it to the downloads site alongside the VM images, and have students apply it with `rake rails:template LOCATION=http://downloads.railsbridge.org/vm.rb`.

## Tests

TODO: There should be some kind of automated test for the output (i.e. can you start the VM, log in, clone a test Rails app, and run it).
