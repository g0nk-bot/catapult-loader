# ubuntu 22.04 vars that are used

# A template to fill in
# Change as needed here

# VM Info

vm_name = "catapult_loader"
guest_os_type = "ubuntu-64"
version = 17

# VM Specs

cpus = 2
cores = 1
memory = 4096
disk_size = 25000
disk_type_id = 0
sound = false

# ISO Info

iso_checksum = "sha256:5e38b55d57d94ff029719342357325ed3bda38fa80054f9330dc789cd2d43931"
# http://releases.ubuntu.com/22.04/SHA256SUMS
iso_target_path = "PATH\\TO\\ISO"
output_directory = "PATH\\TO\\TEMPLATES\NAME"
iso_url = "https://releases.ubuntu.com/22.04.2/ubuntu-22.04.2-live-server-amd64.iso"
iso_file_name = "ubuntu-22.04.2-live-server-amd64.iso"

# Credentials

ssh_username = "vagrant"
ssh_password = "vagrant"
ssh_encrypted_password = "$6$TD83.iB8Oo127YLr$1LaV8r4Q2mHdlcoYC9Lmisj1Hs15rUOJ8WkQENcc24jdNgUYJVxT3FjJfpM9tswGu3mskzhM7nzfdfKwO1NJa/"
ssh_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key"
ssh_timeout = "25m"

# VM Settings

http_source = "http"
vm_timezone = "UTC"
vm_locale = "en_GB"
vm_keyboard = "gb"

# Shutdown

shutdown_command = "sudo shutdown -P now"

# post

vagrant_output = "Path\\to\\packer_{{.BuildName}}_{{.Provider}}.box"