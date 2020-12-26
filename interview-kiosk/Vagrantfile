# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = 'techlit-africa/mint-cinnamon-base'
  config.vm.box_version = '1.2'

  config.ssh.insert_key = false
  config.ssh.username = 'techlit'
  config.ssh.password = 'techlit'

  config.vm.provider 'virtualbox' do |vb|
    vb.gui = true
    vb.memory = '1024'
  end

  config.vm.provision :shell, path: 'provision.bash'
end
