# This is a packer file for Ubuntu 22.04

# Catapult ready

This version is built with the requirements to launch the catapult.

[Catapult, the tool of choice to launch Cyber Ranges](https://github.com/ClarifiedSecurity/catapult)

[Catapult documentation](https://clarifiedsecurity.github.io/catapult-docs/catapult/02-how-to-use/)

**Note:** :information_source: This is based on Ubuntu Server 22.04. It is recommended to use VSCode remote ssh and sync'd folders to manage your project files.
Sync'd folders can be setup in VMware or using the vagrant default sync'd folder. 
By default, Vagrant will share your project directory (the directory with the Vagrant file) to `/vagrant`.

[More information can be found at the Vagrant Docs site](https://developer.hashicorp.com/vagrant/docs/synced-folders)

### KeePassXC setup

Based on the [Catapult Docs,](https://clarifiedsecurity.github.io/catapult-docs/catapult/90-set-up-keepass/0) your KeePass database can be managed on your
host using the GUI application and sync'd folders.

### SSH Keys Setup

Based on the [Catapult Docs.](https://clarifiedsecurity.github.io/catapult-docs/catapult/91-generate-ssh-keypair/)

In short:

1. Open a Terminal on the VM.
2. Generate a keypair.

`ssh-keygen -t ed25519 -C "<comment>"`

3. Save in the default place
4. Specify a passphrase

5. start the ssh-agent in the background.

`eval "$(ssh-agent -s)"`

6. add your key to your ssh-agent.

`ssh-add ~/.ssh/id_ed25519`


### Notes/Misc 

Running on built for VMware Workstation (Pro).
Packed for Vagrant.

Tested on VMware Workstation 17 Pro.

:warning: **Warning** :warning:


Uses default vagrant credentials:

 - vagrant/vagrant

:warning: **Warning** :warning:


 Contains vagrant insecure key

Uses password-less sudo

## Usage 

create the vars file and fill/change as needed

`cp vsphere.pkvars-example.hcl ubuntu-2204.auto.pkrvars.hcl`

### Build from source

Create the template and vagrant box file

The template is kept in `output_directory`

It will download Ubuntu 22.04 LTS if ISO is not found in the target directory.

`packer init .`

`packer validate .`

`packer build .`

### Use Vagrant file

1. Add the box to vagrant

`vagrant box add --name catapult_loader <path/to/the/new.box>`

2. Make a directory for it to live in.

3. Init the box.

`vagrant init catapult_loader`

4. Replace the contents of the created vagrant file from this dir to vagrant dir.
        - this will do a update and clone the Catapult repo
        - also adds VMware network interfaces fix

5. deploy the box.

`vagrant up`

6. Test the box.

`vagrant ssh`

7. Or ssh from VSCode.

8. Change the ownership of the repo

`sudo chown -R vagrant:vagrant Catapult`

8. Follow the KeePass and SSH guides above.

# Messed up?

:bomb: Start again in 2 easy steps

1. `vagrant destory`

2. `vagrant up`

## Download the Vagrant Box

**Note** :information_source: This is only if you are not building from source. You can use the Vagrant box from
[Vagrant Cloud](https://app.vagrantup.com/g0nk-bot/boxes/catapult_loader)

1. Skip the packer stuff and download the box from above.

2. Do the stuff from the Start of Vagrant