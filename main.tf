provider "google" {
  project = "${var.project_id}"
  region      = "${var.region}"
}

module "dcos-tested-oses" {
  source  = "dcos-terraform/gcp-tested-oses/template"
  version = "~> 0.0"

  providers = {
    google = "google"
  }

  os = "${var.dcos_instance_os}"
}


#module "master-backend-service" {
# source = "../terraform-gcp-backend-service"
# # version = "0.0.0"
#
#  name_prefix             = "${var.name_prefix}"
#target
#network
#ip_addresss
#instances_self_link
#dcos_role
#
#}
#
#
#module "master-backend-service" {
# source = "../terraform-gcp-backend-service"
# # version = "0.0.0"
#
#  name_prefix             = "${var.name_prefix}"
#target
#network
#ip_addresss
#instances_self_link
#dcos_role
#
#}


module "dcos-master-instances" {
  #  source  = "dcos-terraform/instance/gcp"  #  version = "~> 0.0"

  source = "../terraform-gcp-instance"

  providers = {
    google = "google"
  }

  name_prefix             = "${var.name_prefix}"
  hostname_format          = "${var.hostname_format}"
  num_instances            = "${var.num_masters}"
  image                    = "${coalesce(var.image, module.dcos-tested-oses.gcp_image_name)}"
  user_data                = "${var.image == "" ? module.dcos-tested-oses.os-setup : var.user_data}"
  machine_type             = "${var.machine_type}"
  instance_subnetwork_name = "${var.master_subnetwork_name}"
  ssh_user                 = "${var.ssh_user}"
  public_ssh_key           = "${var.public_ssh_key}"
  zone_list                = ["${var.zone_list}"]
  disk_type                = "${var.disk_type}"
  disk_size                = "${var.disk_size}"
  tags                     = "${var.tags}"
  project_id               = "${var.project_id}"
  region      = "${var.region}"
}
