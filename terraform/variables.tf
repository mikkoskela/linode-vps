variable "linode_token" {
    description = "Linode API token"
    type = string
}

variable "ssh_key_path" {
    description = "Path to public SSH key to insert on the server"
    type = string
    default = "~/.ssh/linode-vps.pub"
}