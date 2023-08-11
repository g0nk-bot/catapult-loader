# Packer vars defined here

# VM Info

variable "vm_name" {
    type = string
    description = "name of the vm"
}

variable "guest_os_type" {
    type = string
    description = "guest type in VMWare"
}

variable "version" {
    type = number
    description = "VM version"
}

# VM Specs

variable "cpus" {
    type = number
    description = "CPU count"
}

variable "cores" {
    type = number
    description = "Core count"
}

variable "memory" {
    type = number
    description = "Ram in MB"
}

variable "disk_size" {
    type = number
    description = "Storage in MB"
}

variable "disk_type_id" {
    type = number
    description = "disk type"
}

variable "sound" {
    type = bool
    description = "Sound card"
    default = false
}

# ISO Info

variable "iso_checksum" {
    type = string
    description = "SHA256 checksum of the ISO"
}

variable "iso_target_path" {
    type = string
    description = "folder to check for ISO"
}

variable "output_directory" {
    type = string
    description = "created template output dir"
}

variable "iso_file_name" {
    type = string
    description = "the name of the ISO file"
}

variable "iso_url" {
    type = string
    description = "URL to download from when not locally found"
}

# Credntials

variable "ssh_username" {
    type = string
    description = "Username created and log in as"
    sensitive = true
}

variable "ssh_password" {
    type = string
    description = "SSH password"
    sensitive = true
}

variable "ssh_encrypted_password" {
    type = string
    description = "SSH Encrypted password"
    sensitive = true
}

variable "ssh_key" {
    type = string
    description = "ssh pub key to put in auth keys file"
    sensitive = true
}

variable "ssh_timeout" {
    type = string
    description = "timeout for ssh. e.g. 10m"
}

# VM Settings

variable "http_source" {
    type = string
    description = "folder containing http data"
}

variable "vm_timezone" {
    type = string
    description = "timezone for the VM"
}

variable "vm_locale" {
    type = string
    description = "locale for the VM. e.g en_GB"
}

variable "vm_keyboard" {
    type = string
    description = "keyboard setting for the VM. e.g gb"
}

# Shutdown

variable "shutdown_command" {
    type = string
    description = "Command used to shutdown the VM"
}


# post

variable "vagrant_output" {
    type = string
    description = "Full path to for the box file"
}