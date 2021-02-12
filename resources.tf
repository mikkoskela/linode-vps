resource "linode_sshkey" "vps" {
    label = "vps"
    ssh_key = chomp(file("./vps.pub"))
}

resource "linode_instance" "vps" {
    label = "vps"
    image = "linode/debian10"
    region = "eu-central" # London
    type = "g6-nanode-1"
    authorized_keys = [linode_sshkey.vps.ssh_key] # For root account

    #root_pass = ""
    #private_ip = ""

    # TODO: Enable backups

    tags = ["personal"]
}
