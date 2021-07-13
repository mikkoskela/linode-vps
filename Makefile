include linode-credentials.sh
export

SHELL:=/bin/bash
TOKEN:=source ./linode-credentials.sh &&

key:
	@echo "=== Creating a private key ==="
	@test -e ~/.ssh/linode-vps || ssh-keygen -t rsa -b 4096 -f ~/.ssh/linode-vps -N "" -q

create: key
	@echo "=== Initializing Terraform ==="
	@$(TOKEN) terraform -chdir=terraform/ init
	@echo "=== Creating Linode resources ==="
	@$(TOKEN) terraform -chdir=terraform/ apply --auto-approve

destroy:
	@echo "=== Destroying Linode resources ==="
	@$(TOKEN) terraform -chdir=terraform/ destroy --auto-approve

setup: key ip
	@echo "=== Running setup role ==="
	@ansible-playbook ansible/playbook.setup.yml

ip:
	@echo "=== Creating inventory file ==="
	@curl -sS -H "Authorization: Bearer ${LINODE_TOKEN}" https://api.linode.com/v4/linode/instances | jq --raw-output '.data[0].ipv4[0]' > ansible/hosts.ini

customize: ip
	@echo "=== Running customization role ==="
	@ansible-playbook ansible/playbook.customization.yml
