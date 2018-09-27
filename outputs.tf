# Number of Instance
output "num_masters" {
  value = "${var.num_masters}"
}

# Cluster Name
output "name_prefix" {
  value = "${var.name_prefix}"
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
  value = "${module.dcos-master-instances.ssh_user}"
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

# Tested DCOS OSes Name
output "dcos_instance_os" {
  value = "${var.dcos_instance_os}"
}

# Master Node Self Link
output "instances_self_link" {
  value = ["${module.dcos-master-instances.instances_self_link}"]
}

# Returns the ID of the prereq script (if images are not used)
output "prereq_id" {
  value = "${module.dcos-master-instances.prereq_id}"
}
