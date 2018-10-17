# number of instance
variable "num_masters" {
  description = "Specify the amount of masters. For redundancy you should have at least 3"
}

# Cluster Name
variable "cluster_name" {
  description = "Cluster Name"
}

# DCOS version
variable "dcos_version" {
  description = "Specifies which DC/OS version instruction to use. Options: 1.9.0, 1.8.8, etc. See dcos_download_path or dcos_version tree for a full list."
}

# Instance Type
variable "machine_type" {
  description = "machine type"
}

# Element by zone list
variable "zone_list" {
  description = "zone list"
  type        = "list"
  default     = []
}

# Source image to boot from
variable "image" {
  description = "image"
}

# Disk Type to Leverage
variable "disk_type" {
  description = "Disk Type to Leverage. The GCE disk type. Can be either 'pd-ssd', 'local-ssd', or 'pd-standard'. (optional)"
}

# Disk Size in GB
variable "disk_size" {
  description = "disk size"
}

# Instance Subnetwork Name
variable "master_subnetwork_name" {
  description = "master subnetwork name"
}

# Customer Provided Userdata
variable "user_data" {
  description = "User data to be used on these instances (cloud-init)"
  default     = ""
}

# SSH User
variable "ssh_user" {
  description = "ssh user"
}

# SSH Public Key
variable "public_ssh_key" {
  description = "public ssh key"
}

# Add special tags to the resources created by this module
variable "tags" {
  description = "Add custom tags to all resources"
  type        = "list"
  default     = []
}

# Format the hostname inputs are index+1, region, name_prefix
variable "hostname_format" {
  description = "Format the hostname inputs are index+1, region, cluster_name"
  default     = "%[3]s-master%[1]d-%[2]s"
}

# The operating system to use. Instead of using your own AMI you could use a provided OS.
variable "dcos_instance_os" {
  description = "Operating system to use. Instead of using your own AMI you could use a provided OS."
  default     = "centos_7.4"
}

variable "labels" {
  description = "Add custom labels to all resources"
  type        = "map"
  default     = {}
}
