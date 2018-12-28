#/bin/bash
ansible-playbook -i ./hosts install_docker.yml --key-file "~/.ssh/dev2.pem"
