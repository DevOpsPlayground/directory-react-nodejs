Vagrant.configure("2") do |config|

  # Configure the VM using virtualbox provider
  config.vm.define "dockerhost"
  config.vm.box = "AntonioMeireles/coreos-beta"
  config.vm.network "forwarded_port", guest: 5000, host: 5000

  config.vm.provider :virtualbox do |vb|
    vb.name = "dockerhost"
    vb.memory = 1024

    # On VirtualBox, we don't have guest additions or a functional vboxsf
    # in CoreOS, so tell Vagrant that to make it  smarter.
    vb.check_guest_additions = false
    vb.functional_vboxsf     = false
  end

  # use rsync to keep host in sync with guest VM, virtualbox only
  config.vm.synced_folder ".", "/vagrant", type: "rsync"
  config.gatling.rsync_on_startup = false

  # Ensure core user can run docker command and authenticate as the docker user
  config.vm.provision "shell", inline: "sudo groupadd docker;true"
  config.vm.provision "shell", inline: "sudo usermod -a -G docker core;true"

  # Build the Docker image
  config.vm.provision "docker" do |d|
    d.build_image "/vagrant", args: "-t emp_directory"
    d.run "emp_directory", args: "-v '/vagrant/:/code/' --name 'emp_dir_cont' -p 5000:5000"
  end

end
