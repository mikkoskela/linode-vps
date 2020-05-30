resource "linode_sshkey" "my_key" {
    label = "my-key"
    ssh_key = chomp(file("~/.ssh/id_rsa.pub"))
}

resource "linode_instance" "my-instance" {
    label = "my-instance"
    image = "linode/debian10"
    region = "eu-central" # london
    type = "g6-nanode-1"
    authorized_keys = ["${linode_sshkey.my_key.ssh_key}"]

    #root_pass = ""
    #private_ip = ""

    tags = ["personal"]
}
