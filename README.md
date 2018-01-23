# Terraform - AWX in AWS with Web Server

## Summary

Terraform codes to create AWX server along with controlled auto-scalling group in AWS.

## Terraform

### Network
VPC with 2 public subnets.
2 Subnets - one for Web Servers and another one is for DB Server.
Security groups for each Servers.

### Instances
2 Amazon Linux Instances with existing SSH keys.

## How to run

Use the below commands to build, review and execute.

terraform init
terraform get
terraform plan
terraform apply
