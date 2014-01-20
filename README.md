## Original History

* This was originally based on Dan Choi's image (the Rails 4.0 version).
* Modified by Janet Riley on 2014-01-19 to improve configuration and make things more helpful for students:
  - Updated /etc/motd.tail .  Include directions for how to exit.
  - Added .bash_profile so .bashrc is loaded when ssh'ing in.
  - Added .irbrc  - change IRB prompt to red to help students recognize they're in irb.
  - In .bashrc uncommented force_color_prompt - help students recognize they've ssh'ed into vagrant and aren't on home command line.
  - In .bashrc changed PS1 to say RailsBridge VM - help students recognize they're in the vm.
  - In .bashrc,  cd into ~/workspace directory. Students forget to do this and can't find their work.
* Converted by Decklin Foster on 2014-01-20 from building by hand to using Vagrant provisioning:
  - Based on a fresh official Ubuntu 12.04 LTS image
  - Removed the /EMPTY file
  - Add space to .irb prompt
  - Add edit-commit-message script to /usr/local/bin (from an idea by Dan Choi; reimplemented in Ruby).
  - Since we're installing the Heroku toolbelt the recommened way, don't install it from gems
  - Actually install the `therubyracer` gem

In the future, commit messages in this repository will log what changed; this is just for historical reference.
