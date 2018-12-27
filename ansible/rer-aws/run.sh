#/bin/bash
ansible-playbook -i ./hosts ec2-rer.yml --key-file "~/.ssh/dev2.pem"
