#/bin/bash
ansible-playbook -i ./hosts ec2-rer.yml --private-key "~/.ssh/dev2.pem"
