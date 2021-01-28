## Terraform AWS

Developed using terraform version Terraform v0.14.5

This script will create following resources:
1. EC2 instance
2. RDS
3. S3 bucket

#### Install Terraform:
https://www.terraform.io/downloads.html

#### Check terraform is installed:
In terminal type  `terraform version`

#### Clone the repo:
`git clone https://github.com/chirag06/aws-terraform.git`

#### Enter AWS credentials:
Enter your aws access_key and secret_key in main.tf file.

#### Initialize Terraform:
`terraform init`

#### Run Terraform:
`terraform apply`

#### Destroy all the resources created by Terraform:
`terraform destroy`
