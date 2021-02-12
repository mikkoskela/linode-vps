# Personal Linode VPS setup

Setup for personal Linode server.

## Usage
---

**Configure**
1. Rename `terraform.example.tfvars` to `terraform.tfvars`
2. Fill in Linode token.
3. Create SSH key pair: `ssh-keygen -t rsa -b 4096 -f vps -N "" -q`

**Use**
```sh
terraform init
terraform plan
terraform apply
```
