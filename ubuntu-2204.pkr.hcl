packer {
  required_version = ">= 1.7.0"
  required_plugins {
    vmware = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/vmware"
    }
  }
}

locals {
  http_content = {
    "/meta-data" = file("${abspath(path.root)}/http/meta-data")
    "/user-data" = templatefile("${abspath(path.root)}/http/user-data.pkrtpl.hcl", {
      ssh_username = var.ssh_username
      ssh_password = var.ssh_password
      ssh_encrypted_password = var.ssh_encrypted_password
      ssh_key = var.ssh_key
      vm_timezone = var.vm_timezone
      vm_locale = var.vm_locale
      vm_keyboard = var.vm_keyboard
      vm_name = var.vm_name
    })
  }
}

# SOURCE BLOCK

source "vmware-iso" "catapult_loader" {
  # Docs: https://www.packer.io/plugins/builders/vmware/iso

  # VM Info
  vm_name       = var.vm_name
  guest_os_type = var.guest_os_type
  version       = var.version
  headless      = false

  # VM Specs
  cpus         = var.cpus
  cores        = var.cores
  memory       = var.memory
  disk_size    = var.disk_size
  disk_type_id = var.disk_type_id
  sound        = var.sound
  #network      = "bridged"

  # ISO Info
  iso_urls = [
    "file:${var.iso_target_path}${var.iso_file_name}",
    "${var.iso_url}"
    ]
  iso_checksum         = var.iso_checksum
  iso_target_path      = var.iso_target_path
  iso_target_extension = "iso"
  output_directory     = "${var.output_directory}${var.vm_name}"
  http_content         = var.http_source == "http" ? local.http_content : null
  ssh_username         = var.ssh_username
  ssh_password         = var.ssh_password
  ssh_timeout          = var.ssh_timeout
  shutdown_command     = var.shutdown_command

  boot_wait = "5s"
  boot_command = [
    "c<wait>",
    "linux /casper/vmlinuz --- autoinstall ds=\"nocloud-net;seedfrom=http://{{.HTTPIP}}:{{.HTTPPort}}/\"",
    "<enter><wait>",
    "initrd /casper/initrd",
    "<enter><wait>",
    "boot",
    "<enter>"

  ]
}

# BUILD BLOCK

build {
  sources = ["sources.vmware-iso.catapult_loader"]

  post-processors {
    post-processor "vagrant" {
      keep_input_artifact = true
      provider_override   = "vmware"
      output = var.vagrant_output
    }
  }
}
