ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'
 
Vagrant.configure("2") do |config|

#  config.vm.synced_folder ".", "/usr/local/src", :create => true, :mount_options => ["dmode=777","fmode=777"]

  config.vm.define "emp_directory" do |a|
    a.vm.provider "docker" do |d|
      d.build_dir = "."
      d.ports = ["5000", "5000"]
      d.name = "emp_directory"
      d.cmd = ["nodemon", "/usr/local/src/server.js"]
      d.vagrant_machine = "dockerhost"
      d.vagrant_vagrantfile = "./DockerHostVagrantfile"
    end
  end
  
end