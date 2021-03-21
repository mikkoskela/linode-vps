include linode-credentials.sh
export

SHELL:=/bin/bash
TOKEN:=source ./linode-credentials.sh &&

key:
	test -e ~/.ssh/linode-vps || ssh-keygen -t rsa -b 4096 -f ~/.ssh/linode-vps -N "" -q

create: key
	$(TOKEN) terraform -chdir=terraform/ init
	$(TOKEN) terraform -chdir=terraform/ apply --auto-approve

destroy:
	$(TOKEN) terraform -chdir=terraform/ destroy --auto-approve

setup: key ip
	ansible-playbook ansible/playbook.setup.yml

ip:
	curl -sS -H "Authorization: Bearer ${LINODE_TOKEN}" https://api.linode.com/v4/linode/instances | jq --raw-output '.data[0].ipv4[0]' > ansible/hosts.ini

customize: ip
	ansible-playbook ansible/playbook.customization.yml
