RER Project

Provision ec2 instances

ansible-playbook -i ./hosts ec2-rer.yml

Install Apache
ansible-playbook -i ./hosts httpd-rer.yml --private-key /home/zhopa/.ssh/dev2.pem  -u ec2-user


To avoid host key checking place ansible.cfg file with the following config:

[defaults]
host_key_checking = False



<ul>
<li>Line 1</li>
<li>Line 2</li>
</ul>


<p> test <p>
