# Amazon Linux 2 Virtuabox


To automate the creation of a Virtualbox virtual machine based on Amazon Linux 2
image released by AWS at https://cdn.amazonlinux.com/os-images/latest/virtualbox/

A Virtualbox vm enables the usage of Amazon Linux 2 locally with Vagrant. Vagrant
is a command line tool that is able to work on top of Virtualbox as....

Because the Amazon Linux 2 released image is not an ISO file, but a VDI file,
some work is needed to create a working vm box.


## 1. VDI Import

Problem: to use a VDI is a in-place operation. Any modifications will alter the
         downloaded file. Erroneous modifications may not be reversable.

Solution:
  - make a work copy of the downloaded file.
  - import into Virtualbox
  - minimal update: set a working username password
  - tool: VBoxManage: Virtual Box command line

## 2. Create a Vagrant Box

Problem 1: Vagrant needs a username/password as vagrant/vagrant
Problem 2: Vagrant needs to compile a kernel module to enable shared folders

Solution:
  - use a 'provisioner' to create vagrant pre-requisites
  - use a 'provisioner' to run 'Virtualbox Guest Additions' and enable shared folders
  - tool: vagrant? packer?

## 3. Update a Vagrant Box

Problem: Every kernel update disables the previous shared folder module

Solution:
  - from time to time update the kernel box
  - recompile the shared folder module
  - publish an updated Vagrant box
  - tool: vagrant



