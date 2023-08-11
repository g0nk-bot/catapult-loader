#cloud-config

autoinstall:
  version: 1
  apt:
    geoip: true
    disable_components: []
    preserve_sources_list: false
    primary:
      - arches: [amd64, i386]
        uri: http://archive.ubuntu.com/ubuntu
      - arches: [default]
        uri: http://ports.ubuntu.com/ubuntu-ports
  early-commands:
    - sudo systemctl stop ssh
  locale: ${vm_locale}
  keyboard:
    layout: ${vm_keyboard}
  identity:
    hostname: ${vm_name}
    username: ${ssh_username}
    password: ${ssh_encrypted_password}
  ssh:
    install-server: true
    allow-pw: true
    authorized-keys:
      - ${ssh_key}
  packages:
    - openssh-server
    - open-vm-tools
    - cloud-init
    - whois
    - wget
    - git
    - make
    - jq
    - curl
    - sudo
    - keepassxc
  user-data:
    disable_root: false
    timezone: ${vm_timezone}
  late-commands:
    - sed -i -e 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/g' /target/etc/ssh/sshd_config
    - echo '${ssh_username} ALL=(ALL) NOPASSWD:ALL' > /target/etc/sudoers.d/${ssh_username}
    - curtin in-target --target=/target -- chmod 440 /etc/sudoers.d/${ssh_username}
    - "lvresize -v -l +100%FREE /dev/mapper/ubuntu--vg-ubuntu--lv"
    - "resize2fs -p /dev/mapper/ubuntu--vg-ubuntu--lv"