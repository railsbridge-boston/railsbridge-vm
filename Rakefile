desc "Provision VM"
task :up do
  sh 'vagrant', 'up'
end

desc "Build image file from VM"
task :package => :up do
  tag = `git describe --tags HEAD`.chomp
  sh 'vagrant', 'package', '--vagrantfile', 'Vagrantfile.dist', '--output', "railsbridgevm-#{tag}.box"
end
