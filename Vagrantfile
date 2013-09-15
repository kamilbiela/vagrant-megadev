# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # install ubuntu 13.04
  config.vm.box = "ubuntu-raring"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/raring/current/raring-server-cloudimg-amd64-vagrant-disk1.box"
  
  config.vm.hostname = 'mega.dev'
  config.vm.network :private_network, ip: '192.168.66.6'

  # manage your /etc/hosts file
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true
  config.hostmanager.aliases = []

  config.user.projects.each do |entry|
    config.hostmanager.aliases.push(entry["host"])
    config.vm.synced_folder entry["dir"], "/var/www/" + entry["host"], :nfs => true
  end  

  # used for saving logs etc
  config.vm.synced_folder ".", "/vagrant", :mount_options => ['dmode=777', 'fmode=777']

  # fixed chef version to be sure that recipes are working
  config.omnibus.chef_version = "11.4.4"

  # customize Virtualbox machine settings
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--rtcuseutc", "on"]
    vb.customize ["modifyvm", :id, "--memory", 1024]
    vb.customize ["modifyvm", :id, "--cpus", 2]
  end

  # some settings for various recipes
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "./cookbooks"
    chef.roles_path = "./roles"
    chef.add_role "development"
    chef.json = { 
      "mysql" => { 
        "server_root_password" => "toor", 
        "server_repl_password" => "toor", 
        "server_debian_password" => "toor" 
      },
      "apache" => {
        "log_dir" => "/vagrant/logs/apache-logs"
      },
      "node" => {
        "revision" => 'v0.11.7'
      },
      "user_projects" => config.user.projects
    }
  end
end