# Number of Instance
output "num_masters" {
  description = "Specify the amount of masters. For redundancy you should have at least 3"
  value = "${var.num_masters}"
}

# Cluster Name
output "name_prefix" {
  description = "Cluster Name"
  value = "${var.name_prefix}"
}

# Instance Type
output "machine_type" {
  description = "machine type"
  value = "${var.machine_type}"
}

# Element by zone list
output "zone_list" {
  description = "zone list"
  value = ["${var.zone_list}"]
}

# Source image to boot from
output "image" {
  description = "image"
  value = "${var.image}"
}

# Disk Type to Leverage
output "disk_type" {
  description = "Disk Type to Leverage. The GCE disk type. Can be either 'pd-ssd', 'local-ssd', or 'pd-standard'. (optional)"
  value = "${var.disk_type}"
}

# Disk Size in GB
output "disk_size" {
  description = "disk size"
  value = "${var.disk_size}"
}

# Instance Subnetwork Name
output "master_subnetwork_name" {
  description = "master subnetwork name"
  value = "${var.master_subnetwork_name}"
}

# Customer Provided Userdata
output "user_data" {
  description = "User data to be used on these instances (cloud-init)"
  value = "${var.user_data}"
}

# SSH User
output "ssh_user" {
  description = "ssh user"
  value = "${module.dcos-master-instances.ssh_user}"
}

# SSH Public Key
output "public_ssh_key" {
  description = "public ssh key"
  value = "${var.public_ssh_key}"
}

# Private IP Addresses
output "private_ips" {
  description = "List of private ip addresses created by this module"
  value = ["${module.dcos-master-instances.private_ips}"]
}

# Public IP Addresses
output "public_ips" {
  description = "List of public ip addresses created by this module"
  value = ["${module.dcos-master-instances.public_ips}"]
}

# Tested DCOS OSes Name
output "dcos_instance_os" {
  description = "Operating system to use. Instead of using your own AMI you could use a provided OS."
  value = "${var.dcos_instance_os}"
}

# Master Node Self Link
output "instances_self_link" {
  description = "List of instance self links"
  value = ["${module.dcos-master-instances.instances_self_link}"]
}

# Returns the ID of the prereq script (if images are not used)
output "prereq_id" {
  description = "prereq id"
  value = "${module.dcos-master-instances.prereq_id}"
}
