# Terraform & Ansible - Autoscaling nginx Web Server in AWS

## Summary

Terraform codes to create Web server using ansible along with controlled auto-scalling group in AWS.

## Terraform

### Network
VPC with 2 public subnets.
2 Subnets to maintain instances in different availability zones.
Security groups for each Servers.

### Instances
1 Amazon Linux Instance with existing SSH keys. Autoscaling to determine the number of instances.

## How to run

Make sure that you have a SSH key and mentioned in vars.tf.

Change the AWS region in vars.tf to your preferred one.

Use the below commands to build, review and execute.

terraform init  
terraform get  
terraform plan  
terraform apply  
