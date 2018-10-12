[![Build Status](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-gcp-masters/job/master/badge/icon)](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-gcp-masters/job/master/)
# DC/OS Instances

Creates DC/OS Master intances

## Usage

```hcl
module "masters" {
  source = "dcos-terraform/instances/gcp"
  version = "~> 0.0"

  num_instance                   = "${var.instances_count}"
  disk_size                      = "${var.gcp_instances_disk_size}"
  disk_type                      = "${var.gcp_instances_disktype}"
  region                         = "${var.gcp_region}"
  machine_type                   = "${var.gcp_instances_gce_type}"
  cluster_name                   = "${var.cluster_name}"
  public_ssh_key                 = "${var.gcp_ssh_key}"
  instances_subnetwork_name      = "${module.network.instances_subnetwork_name}"
  instances_targetpool_self_link = "${module.network.instances_targetpool_self_link}"
  customer_image                 = "${var.image}"
  region                         = "${var.gcp_region}"
  zone_list                      = "${data.google_compute_zones.available.names}"
}
```


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cluster_name | Cluster Name | string | - | yes |
| dcos_instance_os | Operating system to use. Instead of using your own AMI you could use a provided OS. | string | `centos_7.4` | no |
| dcos_version | Specifies which DC/OS version instruction to use. Options: 1.9.0, 1.8.8, etc. See dcos_download_path or dcos_version tree for a full list. | string | - | yes |
| disk_size | disk size | string | - | yes |
| disk_type | Disk Type to Leverage. The GCE disk type. Can be either 'pd-ssd', 'local-ssd', or 'pd-standard'. (optional) | string | - | yes |
| hostname_format | Format the hostname inputs are index+1, region, cluster_name | string | `%[2]s-masters-%[1]d` | no |
| image | image | string | - | yes |
| labels | Add custom labels to all resources | map | `<map>` | no |
| machine_type | machine type | string | - | yes |
| master_subnetwork_name | master subnetwork name | string | - | yes |
| num_masters | Specify the amount of masters. For redundancy you should have at least 3 | string | - | yes |
| public_ssh_key | public ssh key | string | - | yes |
| ssh_user | ssh user | string | - | yes |
| tags | Add custom tags to all resources | list | `<list>` | no |
| user_data | User data to be used on these instances (cloud-init) | string | `` | no |
| zone_list | zone list | list | `<list>` | no |

## Outputs

| Name | Description |
|------|-------------|
| dcos_instance_os | Tested DCOS OSes Name |
| disk_size | Disk Size in GB |
| disk_type | Disk Type to Leverage |
| image | Source image to boot from |
| instances_self_link | Master Node Self Link |
| machine_type | Instance Type |
| master_subnetwork_name | Instance Subnetwork Name |
| name_prefix | Cluster Name |
| num_masters | Number of Instance |
| prereq_id | Returns the ID of the prereq script (if images are not used) |
| private_ips | Private IP Addresses |
| public_ips | Public IP Addresses |
| public_ssh_key | SSH Public Key |
| ssh_user | SSH User |
| user_data | Customer Provided Userdata |
| zone_list | Element by zone list |

