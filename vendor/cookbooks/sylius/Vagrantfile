# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "sylius-berkshelf"
  config.vm.box = "opscode-ubuntu-1204"
  config.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04-i386_chef-11.4.4.box"
  config.vm.network :private_network, ip: "33.33.33.10"
  config.ssh.max_tries = 40
  config.ssh.timeout = 120
  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      :mysql => {
        :server_root_password => 'rootpass',
        :server_debian_password => 'debpass',
        :server_repl_password => 'replpass'
      }
    }
    chef.run_list = [
      "recipe[sylius::default]",
      "minitest-handler"
    ]
  end
end
