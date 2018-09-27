/**
 * [![Build Status](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-gcp-masters/job/master/badge/icon)](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-gcp-masters/job/master/)
 * # DC/OS Instances
 *
 * Creates DC/OS Master intances
 *
 * ## Usage
 *
 *```hcl
 * module "masters" {
 *   source = "dcos-terraform/instances/gcp"
 *   version = "~> 0.0"
 *
 *   num_instance                   = "${var.instances_count}"
 *   disk_size                      = "${var.gcp_instances_disk_size}"
 *   disk_type                      = "${var.gcp_instances_disktype}"
 *   region                         = "${var.gcp_region}"
 *   machine_type                   = "${var.gcp_instances_gce_type}"
 *   cluster_name                   = "${var.cluster_name}"
 *   public_ssh_key                 = "${var.gcp_ssh_key}"
 *   instances_subnetwork_name      = "${module.network.instances_subnetwork_name}"
 *   instances_targetpool_self_link = "${module.network.instances_targetpool_self_link}"
 *   customer_image                 = "${var.image}"
 *   region                         = "${var.gcp_region}"
 *   zone_list                      = "${data.google_compute_zones.available.names}"
 * }
 *```
 */

provider "google" {}

module "dcos-master-instances" {
  source  = "dcos-terraform/instance/gcp"
  version = "~> 0.0"

  providers = {
    google = "google"
  }

  name_prefix              = "${var.name_prefix}"
  hostname_format          = "${var.hostname_format}"
  num_instances            = "${var.num_masters}"
  image                    = "${var.image}"
  user_data                = "${var.user_data}"
  machine_type             = "${var.machine_type}"
  instance_subnetwork_name = "${var.master_subnetwork_name}"
  ssh_user                 = "${var.ssh_user}"
  public_ssh_key           = "${var.public_ssh_key}"
  zone_list                = ["${var.zone_list}"]
  disk_type                = "${var.disk_type}"
  disk_size                = "${var.disk_size}"
  tags                     = "${var.tags}"
  dcos_instance_os         = "${var.dcos_instance_os}"
  dcos_version             = "${var.dcos_version}"
}
