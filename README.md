# Vagrant Moodle

## Requirements


* You need to have [Vagrant] and the official [VirtualBox] installed.
* [vagrant-hosts] vagrant plugin. It will be installed the first time you run vm script.

    `vagrant plugin install vagrant-hosts`

* The host machine probably needs at least 4 GB of RAM.
* As Oracle 11g XE is only available for 64-bit machines at the moment, the host machine needs to
  have a 64-bit architecture.
* You may need to [enable virtualization] manually.

## Installation

* Check out this project:

        git clone https://github.com/crazyserver/vagrant_moodle.git

* Configure your needs:

    * Edit vm script and change username variable by your username on github. This will clone your moodle fork on github and it will install it.

    * Edit provision.sh and change database=$1 by your prefered database engine [pgsql (default) mysql, or oci).

    * If you select oci (Oracle), you will need to download [Oracle Database 11g Express Edition] and [Oracle Instant Client] - Basic and Devel - for Linux x64. Place all downloaded files (`oracle-xe-11.2.0-1.0.x86_64.rpm.zip`, `oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm` and `oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm`) in the directory `provision/oracle` of this project.

* Please note that building the VM involves downloading an Ubuntu
  [base box](http://docs.vagrantup.com/v2/boxes.html) which is ~400MB in size.

## Vm Manages usage

In the root directory there is an script called vm. You may use this script to manage the VM's in order to get updates.

`./vm`

This will start the VM getting and executing the latest updates. This should take a few minutes.

After that all you need is to enter to your [Vagrant VM] on http://moodle.test/

You may also want to use vagrant standard commands:

* **vagrant up** to start the VM.

* **vagrant ssh** to enter into the VM via ssh.

* **vagrant halt** to stop the VM.

* **vagrant reload** to restart the VM.

* **vagrant destroy** to completely delete the VM. Asks for confirmation.

## Hostnames and IP

You must change your /etc/hosts to access successfully to all the VM's:

 * 192.168.33.5 moodle moodle.test


Oracle installation based in [vagrant-oracle-xe]

[Vagrant VM]: http://moodle.test/

[Vagrant]: http://www.vagrantup.com/

[VirtualBox]: https://www.virtualbox.org/

[Oracle Database 11g Express Edition]: http://www.oracle.com/technetwork/database/database-technologies/express-edition/downloads/index.html

[Oracle Instant Client]: http://www.oracle.com/technetwork/topics/linuxx86-64soft-092277.html

[Oracle Database 11g EE Documentation]: http://docs.oracle.com/cd/E17781_01/index.htm

[vagrant-oracle-xe]: https://github.com/codescape/vagrant-oracle-xe

[vbguest]: https://github.com/dotless-de/vagrant-vbguest

[enable virtualization]: http://www.sysprobs.com/disable-enable-virtualization-technology-bios

[vagrant-hosts]: https://github.com/adrienthebo/vagrant-hosts
