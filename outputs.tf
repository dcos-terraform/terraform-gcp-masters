# Number of Instance
output "num_masters" {
  description = "Specify the amount of masters. For redundancy you should have at least 3"
  value       = "${var.num_masters}"
}

# Cluster Name
output "name_prefix" {
  description = "Name of the DC/OS cluster"
  value       = "${var.cluster_name}"
}

# Instance Type
output "machine_type" {
  description = "Instance Type"
  value       = "${var.machine_type}"
}

# Element by zone list
output "zone_list" {
  description = "Element by zone list"
  value       = ["${var.zone_list}"]
}

# Source image to boot from
output "image" {
  description = "Source image to boot from"
  value       = "${var.image}"
}

# Disk Type to Leverage
output "disk_type" {
  description = "Disk Type to Leverage"
  value       = "${var.disk_type}"
}

# Disk Size in GB
output "disk_size" {
  description = "Disk Size in GB"
  value       = "${var.disk_size}"
}

# Instance Subnetwork Name
output "master_subnetwork_name" {
  description = "Master Subnetwork Name"
  value       = "${var.master_subnetwork_name}"
}

# Customer Provided Userdata
output "user_data" {
  description = "User data to be used on these instances (cloud-init)"
  value       = "${var.user_data}"
}

# SSH User
output "ssh_user" {
  description = "SSH User"
  value       = "${module.dcos-master-instances.ssh_user}"
}

# SSH Public Key
output "public_ssh_key" {
  description = "SSH Public Key"
  value       = "${var.public_ssh_key}"
}

# Private IP Addresses
output "private_ips" {
  description = "List of private ip addresses created by this module"
  value       = ["${module.dcos-master-instances.private_ips}"]
}

# Public IP Addresses
output "public_ips" {
  description = "List of public ip addresses created by this module"
  value       = ["${module.dcos-master-instances.public_ips}"]
}

# Tested DCOS OSes Name
output "dcos_instance_os" {
  description = "Operating system to use. Instead of using your own AMI you could use a provided OS."
  value       = "${var.dcos_instance_os}"
}

# Master Node Self Link
output "instances_self_link" {
  description = "List of instance self links"
  value       = ["${module.dcos-master-instances.instances_self_link}"]
}

# Returns the ID of the prereq script (if images are not used)
output "prereq_id" {
  description = "Prereq id used for dependency"
  value       = "${module.dcos-master-instances.prereq_id}"
}
