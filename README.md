# vagrant-megadev

Easily run multiple projects in virtual machine (for now mainly PHP) using one simple configfile.

# Installation

You must install vagrant and virtualbox on Your system.

This Vagrantfile was developed on vagrant version ``1.3.1``, so I recommend using it.

Also note that sites are mounted to guest machine via NFS (mounting via shared folders on virtualbox is super slow). On Max OS X it works out of the box, on Linux/Ubuntu You must install nfs support (I think it's something like this: ``apt-get install nfs-kernel-server``)

Remember to add exceptions to firewall config (in mac: System Preferences > Security & privacy > Firewall tab > Firewall Options... > Add vagrant to the list)

* clone this repo
* ``git submodule init``
* ``git submodule update``
* ``./vagrant_bootstrap.sh`` - installs required plugins
* create ``.vagrantuser`` file and configure sites in it.

Example of ``.vagrantuser`` file:

```yaml
projects:
  - host: site1.mega.dev
    dir:  ../site1.mega.dev/
    web_dir: /
  - host: site2.mega.dev
    dir:  ../site2_myproject
    web_dir: /web
```

Attributes in ``projects`` property in ``.vagrantuser``:

* ``host`` - hostname
* ``dir`` - project directory on Your computer relative to this file.
* ``web_dir`` - location of web directory in Your project.  

Run commmand: 
```sh
vagrant up
vagrant hostmanager
```

This will update /etc/hosts file on Your computer

# Reconfiguring hosts after first install

Edit ``.vagrantuser`` file

```sh
vagrant reload
vagrant provision
vagrant hostmanager
```