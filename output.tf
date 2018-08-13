# Number of Instance
output "num_masters" {
  value = "${var.num_masters}"
}

# Cluster Name
output "cluster_name" {
  value = "${var.cluster_name}"
}

# Instance Type
output "machine_type" {
  value = "${var.machine_type}"
}

# Element by zone list
output "zone_list" {
  value = ["${var.zone_list}"]
}

# Source image to boot from
output "image" {
  value = "${var.image}"
}

# Disk Type to Leverage
output "disk_type" {
  value = "${var.disk_type}"
}

# Disk Size in GB
output "disk_size" {
  value = "${var.disk_size}"
}

# Instance Subnetwork Name
output "master_subnetwork_name" {
  value = "${var.master_subnetwork_name}"
}

# Customer Provided Userdata
output "user_data" {
  value = "${var.user_data}"
}

# SSH User
output "ssh_user" {
  value = "${var.ssh_user}"
}

# SSH Public Key
output "public_ssh_key" {
  value = "${var.public_ssh_key}"
}

# Private IP Addresses
output "private_ips" {
  value = ["${module.dcos-master-instances.private_ips}"]
}

# Public IP Addresses
output "public_ips" {
  value = ["${module.dcos-master-instances.public_ips}"]
}
