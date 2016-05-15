desc "Provision VM"
task :up do
  sh 'vagrant', 'box', 'update'
  sh 'vagrant', 'up'
end

desc "Build image file from VM"
task :package => :up do
  tag = `git describe --tags --always HEAD`.chomp
  sh 'vagrant', 'package', '--vagrantfile', 'Vagrantfile.dist', '--output', "railsbridgevm-#{tag}.box"
end

desc "Destroy VM"
task :cleanup do
  sh 'vagrant', 'halt'
  sh 'vagrant', 'destroy'
end
