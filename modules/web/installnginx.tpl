#!/bin/bash
yum install git -y;
pip install ansible;
git clone https://github.com/arocki7/terraform-ansible.git /tmp/terraform-ansible;
ansible-playbook -i /tmp/terraform-ansible/ansible/hosts /tmp/terraform-ansible/ansible/web.yml
