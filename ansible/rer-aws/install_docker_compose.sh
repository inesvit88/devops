#/bin/bash
ansible-playbook -i ./hosts install_docker_compose.yml --private-key "~/.ssh/dev2.pem" -u ec2-user
