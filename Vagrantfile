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

  config.vbguest.auto_update = false

  # use rsync to keep host in sync with guest VM
  config.vm.synced_folder ".", "/vagrant", type: "rsync"
  config.gatling.rsync_on_startup = false

  # Ensure core user can run docker command and authenticate as the dockeruser
  config.vm.provision "shell", inline: "sudo groupadd docker;true"
  config.vm.provision "shell", inline: "sudo usermod -a -G docker core;true"
  config.vm.provision "shell", inline: "docker login -u AWS -p CiBwm0YaISJeRtJm5n1G6uqeekXuoXXPe5UFce9Rq8/14xK+BgEBAgB4cJtGGiEiXkbSZuZ9RurqnnpF7qF1z3uVBXHvUavP9eMAAAMVMIIDEQYJKoZIhvcNAQcGoIIDAjCCAv4CAQAwggL3BgkqhkiG9w0BBwEwHgYJYIZIAWUDBAEuMBEEDO1Se0yriZWVd4y9OAIBEICCAsj9xqsTBer7uxojUSTjy4Fcx9ovqN8h3hm/LSnzw8eFb14ScT6YHd6aQM2pF9+TfJX8ivz0CfNlPOwypHXzc5bOxc1UosHbMC7RygTDFrGWb4kda+qJc8rP7hjcOp8FObyAv8JarzosCmKfrcJq4vMqUti7NBoAJiqW3eCInh5J+VtgMIzgoO2at15Nczy/GIHJQ4psUBS+yZznNHbclT1qBD1S7ROdoLyc9x5gV8jFAZnh0cLDV0XsM1vNRT9MEagpkA9gJ5z5n5ZNojAQgVZKgKXmVevvM5WMtG6iKrhBMUl0b/FYDNI8GkxIRILDPT/PrV3DuM0VS7/x8mXVm6UajjQ7+ucJnItoBH0TGSnmSsMfs722hrBYLycvuwYwi+4mWs5tCxB6dHASGV0a2cFAVwPZ+Pozj9/QN3C37c+HmPS6n1yZLr9hMIv+3hNGEOGYuM41Rcc7gjQcLWdjcXK6QYcJAooufKRTe7Z764pAMRJiWRBsa6WzSsFSdlFx/hS9DJgmtR0wvNeEBOj5q7VwnGCF7DPqpfOxR5X/Jx/7TOyOPl/jHTBtp8LAur/90KYUINHvy3pzVCaS9+Ffa7CpiORcGk8D0kU9pyD0afSah7Tc8tidY8SafLURwLTc1xq9plZ0RDfM/pfe2ngYIpxMHOlqueI5xmvVAk6UT5OxkuhHDrva7BGiuA5zJpQUJiDWhmA/BngpUKf6WVU65G1fXe2696+tvHP6QHqZw6qL5fWw3d/cNuz7gqlf+5taZM/cJpJD6YkrmVIC1T6WaE54EEdJqtz34Ur/nKCfLaHoSrrSwkwmUceHhyyFtP/XX73dr9FLsoIXjWiQ0+GpUX4dqA6w3CFdJcZxy3NC2+zGm5tYdBfXpZ5Nu7o+diLU0zVxJr+uRb1Pcd8LjK6LfBCKkDwRBRv6V7OUfgu8pwzxVPqtpxQ3XhNN -e none https://315032081542.dkr.ecr.us-east-1.amazonaws.com"

  # Build the Docker image
  config.vm.provision "docker" do |d|
    d.run "315032081542.dkr.ecr.us-east-1.amazonaws.com/sameetn-repo:latest", args: "-v '/vagrant/:/code/' --name 'emp_dir_cont' -p 5000:5000"
  end

end
