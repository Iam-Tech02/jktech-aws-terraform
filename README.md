Terraform Infra Setup

This repository contains Terraform code to provision cloud infrastructure.

Before You Start

1. Update remote_state.tf  
   - Set your S3 bucket, key, and region for remote state

2. Configure ECR (optional)  
   - Edit ecr.sh with the correct repository, region, and image details  
   - Run the script: ./ecr.sh  
   - Alternatively, use: make push-ecr

3. Set variables  
   - Edit dev.auto.tfvars with environment-specific values

Running Terraform

Use the Makefile:

make init  
make plan  
make apply

Or run directly:

terraform init  
terraform plan  
terraform apply

Ensure AWS credentials are configured before running the commands.
