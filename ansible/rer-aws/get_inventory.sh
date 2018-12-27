#/bin/bash
ansible-playbook -i hosts ec2-rer-inventory.yml --private-key ~/.ssh/dev2.pem
