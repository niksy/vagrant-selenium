Vagrant.configure(2) do |config|
  config.vm.box = "hashicorp/precise64"
  config.vm.provision "shell", path: "bootstrap.sh"
  config.vm.network :forwarded_port, guest:4444, host:4444

  config.vm.provider :virtualbox do |vb|
    vb.gui = true
  end
end
