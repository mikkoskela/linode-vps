# my-linode

Set up for personal Linode server

## Usage

1. Rename `config.example.tfvars` to `config.tfvars`
2. Fill in Linode token
3. Plan and apply: `terraform plan -var-file config.tfvars` && `terraform apply -var-file config.tfvars`
