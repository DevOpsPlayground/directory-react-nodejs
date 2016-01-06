ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'
 
Vagrant.configure("2") do |config|
  config.vm.define "emp_directory" do |a|
    a.vm.provider "docker" do |d|
      d.build_dir = "."
      d.name = "emp_directory_react"
      d.vagrant_machine = "dockerhost"
      d.vagrant_vagrantfile = "./DockerHostVagrantfile"
    end
  end
  config.vm.network "forwarded_port", guest: 5000, host: 5000
end