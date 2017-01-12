# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "trusty64"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.network :forwarded_port, guest: 10811, host: 10811, auto_correct: true
  config.vm.network :forwarded_port, guest: 10800, host: 10800, auto_correct: true
  config.vm.network :forwarded_port, guest: 10808, host: 10808, auto_correct: true
  config.vm.network :forwarded_port, guest: 64444, host: 64444, auto_correct: true
  config.vm.network :forwarded_port, guest: 12221, host: 12221, auto_correct: true
  config.vm.network :forwarded_port, guest: 13131, host: 13131, auto_correct: true
  config.vm.network :forwarded_port, guest: 30003, host: 30003, auto_correct: true
  config.vm.network :forwarded_port, guest: 41300, host: 41300, auto_correct: true
  config.vm.network :forwarded_port, guest: 20202, host: 20202, auto_correct: true
  config.vm.network :forwarded_port, guest: 11111, host: 11111, auto_correct: true
  config.vm.network :forwarded_port, guest: 19999, host: 19999, auto_correct: true
  config.vm.network :forwarded_port, guest: 12016, host: 12016, auto_correct: true
  config.vm.network :forwarded_port, guest: 17777, host: 17777, auto_correct: true
  config.vm.network :forwarded_port, guest: 80, host: 8080, auto_correct: true
  config.vm.network :forwarded_port, guest: 22, host: 6174
  config.vm.network :forwarded_port, guest: 8000, host: 8000, auto_correct: true
  config.vm.network :forwarded_port, guest: 27017, host: 27017, auto_correct: true
  config.vm.network :forwarded_port, guest: 1337, host: 1337, auto_correct: true
  config.vm.synced_folder ".", "/vagrant", :mount_options => ["dmode=755","fmode=755"]
  config.vm.provision :shell, :path => "scripts/vagrant_setup.sh"
  config.ssh.forward_agent = true

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end
end
