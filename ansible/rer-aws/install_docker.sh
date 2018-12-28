#/bin/bash
ansible-playbook -i ./hosts install_docker.yml --private-key "~/.ssh/dev2.pem"
