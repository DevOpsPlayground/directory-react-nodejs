Vagrant.configure("2") do |config|
 
  # Configure the VM using virtualbox provider
  config.vm.define "dockerhost"
  config.vm.box = "williamyeh/centos7-docker"
  config.vm.network "forwarded_port", guest: 5000, host: 5000
 
  config.vm.provider :virtualbox do |vb|
    vb.name = "dockerhost"
    vb.memory = 1024
  end

  # Define the docker file and container etc.
  #config.vm.provision "docker"

  # Ensure vagrant user can run docker command
  config.vm.provision "shell", inline: "sudo groupadd docker;true"
  config.vm.provision "shell", inline: "sudo usermod -a -G docker vagrant;true"

  # Build the Docker image
  config.vm.provision "docker" do |d|
    d.build_image "/vagrant", args: "-t emp_directory"
    d.run "emp_directory", args: "-v '/vagrant/:/code/' --name 'emp_dir_container' -p 5000:5000"
  end

end