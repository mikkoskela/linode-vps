# Linode VPS setup

Create and configure a virtual machine on Linode.

## Usage
---

**1. Pre-requisities**

- Linode account
- Linode API TOKEN
- Terraform v0.14.6+
- Ansible v2.9.6+
- GNU Make
- jq
- Python v3

**2. Configure**

1. Add Linode API token into `linode-credentials.sh`
2. Add settings in `ansible/credentials.yml`

**3. Create Linode resources**

Run:

```sh
make create
```

**4. Basic security and system configuration**

Run:

```sh
make setup
```

**5. Apply customization**

Run:

```sh
ansible-playbook ansible/playbook.customization.yml
```

