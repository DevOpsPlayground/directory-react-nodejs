ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'
 
Vagrant.configure("2") do |config|

  config.vm.synced_folder ".", "/usr/local/src"

  config.vm.define "emp_directory" do |a|
    a.vm.provider "docker" do |d|
      d.build_dir = "."
      d.name = "emp_directory"
      d.vagrant_machine = "dockerhost"
      d.vagrant_vagrantfile = "./DockerHostVagrantfile"
    end
  end
  
end