provider "google" {}

data "google_compute_subnetwork" "a" {
  name = "${var.master_subnetwork_name}"

  #  region  = "${var.region}"
}

module "dcos-tested-oses" {
  source  = "dcos-terraform/gcp-tested-oses/template"
  version = "~> 0.0"

  providers = {
    google = "google"
  }

  os = "${var.dcos_instance_os}"
}

# mbernadin(todo)
# Multi Region Requires Multiple Instance Groups
#
# Instance groups must contain at least one instance
# (https://www.terraform.io/docs/providers/google/r/compute_region_backend_service.html#group)
# Therefore, we would need to dynamtically create an instance group
# per zone depending on the number of masters.
# For the time being, we will be removing the internal load balancer since there is no
# current use as DCOS does not support zookeeper google backend. The standard deployment
# will be a "static" DCOS backend
#
#module "master-backend-service" {
#  source = "../terraform-gcp-backend-service"
#
#  # version = "0.0.0"
#
#  providers = {
#    google = "google"
#  }
#
#  name_prefix         = "${var.name_prefix}"
#  network             = "${data.google_compute_subnetwork.a.network}"
#  instances_self_link = "${module.dcos-master-instances.instances_self_link}"
#  target_pool         = "${module.dcos-master-instances.target_pool}"
#  dcos_role           = "master"
#}

module "master-frontend-compute-firewall" {
  source = "../terraform-gcp-compute-firewall"

  # version = "0.0.0"

  providers = {
    google = "google"
  }
  name_prefix         = "${var.name_prefix}"
  network             = "${data.google_compute_subnetwork.a.network}"
  instances_self_link = "${module.dcos-master-instances.instances_self_link}"
  dcos_role           = "master"
}

module "dcos-master-instances" {
  #  source  = "dcos-terraform/instance/gcp"  #  version = "~> 0.0"

  source = "../terraform-gcp-instance"

  providers = {
    google = "google"
  }

  name_prefix              = "${var.name_prefix}"
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

  #  dcos_instance_os         = "
}
