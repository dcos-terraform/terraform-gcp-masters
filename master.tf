provider "google" {}

module "dcos-tested-oses" {
  source  = "dcos-terraform/tested-oses/gcp"
  version = "~> 0.0"

  providers = {
    google = "google"
  }

  os = "${var.dcos_instance_os}"
}

module "dcos-master-instances" {
  source  = "dcos-terraform/instance/gcp"
  version = "~> 0.0"

  providers = {
    google = "google"
  }

  cluster_name             = "${var.cluster_name}"
  hostname_format          = "${var.hostname_format}"
  num                      = "${var.num_masters}"
  image                    = "${coalesce(var.image, module.dcos-tested-oses.gcp_image_name)}"
  user_data                = "${var.image == "" ? module.dcos-tested-oses.os-setup : var.gcp_user_data}"
  machine_type             = "${var.machine_type}"
  instance_subnetwork_name = ["${var.master_subnetwork_name}"]
  ssh_user                 = "${var.ssh_user}"
  public_ssh_key           = "${var.public_ssh_key}"
  zone_list                = "${var.zone_list}"
  disk_type                = "${var.disk_type}"
  disk_size                = "${var.disk_size}"
  tags                     = "${var.tags}"
}
