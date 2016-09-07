desc "Provision VM"
task :up do
  sh 'vagrant', 'box', 'update'
  sh 'vagrant', 'up'
end

desc "Build image file from VM"
task :package do
  require 'digest/sha2'
  tag = `git describe --tags --always HEAD`.chomp
  box = "railsbridgevm-#{tag}.box"
  sh 'vagrant', 'package', '--vagrantfile', 'Vagrantfile.dist', '--output', box
  puts "SHA256 (#{box}) = #{Digest::SHA256.hexdigest(File.read(box))}"
end

desc "Destroy VM"
task :cleanup do
  sh 'vagrant', 'halt'
  sh 'vagrant', 'destroy'
end
