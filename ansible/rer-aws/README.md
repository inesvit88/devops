#RER Project

## Provision ec2 instances

ansible-playbook -i ./hosts ec2-rer.yml

## Install Apache
ansible-playbook -i ./hosts httpd-rer.yml --private-key /home/zhopa/.ssh/dev2.pem  -u ec2-user


To avoid host key checking, place **ansible.cfg** file along the playbooks with the following config:
```
[defaults]
host_key_checking = False
```
# TO-DO List

- [X] Install Jenkins
- [ ] Configuire Jenkins pipelines for CI & CD
- [ ] Automate Cloud provisioning from VPC
- [ ] Autoconfig ansible instance 
- [ ] Autoconfig docker instance 
- [ ] Autoconfig WordPress instance 
- [ ] Think about docker-swarm approach to container scalability


git config --global credential.helper cache

export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""

