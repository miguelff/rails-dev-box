# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure('2') do |config|
  config.vm.box      = 'ubuntu/trusty64'
  config.vm.hostname = 'rails-dev-box'

  config.vm.network :forwarded_port, guest: 3000, host: 3000

  config.vm.provision :shell, path: 'bootstrap.sh'
  config.vm.provision :shell, path: 'install-rvm.sh',  args: 'stable',       privileged: false
  config.vm.provision :shell, path: 'install-ruby.sh', args: '2.3.0-clang',  privileged: false
  config.vm.provision :shell, inline: <<-SHELL
    echo 'Done. Run `vagrant ssh` to log into your dev-box!'
  SHELL
end
