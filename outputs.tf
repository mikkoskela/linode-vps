output "ip" {
    description = "IP address of the linode machine."
    value = linode_instance.vps.ip_address
}

output "ssh" {
    description = "SSH command to connect to the instance."
    value = "ssh -i ./vps root@${linode_instance.vps.ip_address}"
}
