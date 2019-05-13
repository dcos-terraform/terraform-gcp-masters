[![Build Status](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-gcp-masters/job/master/badge/icon)](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-gcp-masters/job/master/)
# DC/OS Instances

Creates DC/OS Master intances

## Usage

```hcl
module "masters" {
  source = "dcos-terraform/instance/gcp"
  version = "~> 0.1.0"

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
| cluster\_name | Name of the DC/OS cluster | string | n/a | yes |
| dcos\_version | Specifies which DC/OS version instruction to use. Options: 1.12.3, 1.11.10, etc. See dcos_download_path or dcos_version tree for a full list. | string | n/a | yes |
| disk\_size | Disk Size in GB | string | n/a | yes |
| disk\_type | Disk Type to Leverage The GCE disk type. Can be either 'pd-ssd', 'local-ssd', or 'pd-standard'. (optional) | string | n/a | yes |
| image | Source image to boot from | string | n/a | yes |
| machine\_type | Instance Type | string | n/a | yes |
| master\_subnetwork\_name | Master Subnetwork Name | string | n/a | yes |
| num\_masters | Specify the amount of masters. For redundancy you should have at least 3 | string | n/a | yes |
| public\_ssh\_key | SSH Public Key | string | n/a | yes |
| ssh\_user | SSH User | string | n/a | yes |
| dcos\_instance\_os | Operating system to use. Instead of using your own AMI you could use a provided OS. | string | `"centos_7.4"` | no |
| hostname\_format | Format the hostname inputs are index+1, region, cluster_name | string | `"%[3]s-master%[1]d-%[2]s"` | no |
| labels | Add custom labels to all resources | map | `<map>` | no |
| tags | Add custom tags to all resources | list | `<list>` | no |
| user\_data | User data to be used on these instances (cloud-init) | string | `""` | no |
| zone\_list | Element by zone list | list | `<list>` | no |

## Outputs

| Name | Description |
|------|-------------|
| dcos\_instance\_os | Operating system to use. Instead of using your own AMI you could use a provided OS. |
| disk\_size | Disk Size in GB |
| disk\_type | Disk Type to Leverage The GCE disk type. Can be either 'pd-ssd', 'local-ssd', or 'pd-standard'. (optional) |
| image | Source image to boot from |
| instances\_self\_link | List of instance self links |
| machine\_type | Instance Type |
| master\_subnetwork\_name | Master Subnetwork Name |
| name\_prefix | Name Prefix |
| num\_masters | Specify the amount of masters. For redundancy you should have at least 3 |
| prereq\_id | Prereq id used for dependency |
| private\_ips | List of private ip addresses created by this module |
| public\_ips | List of public ip addresses created by this module |
| public\_ssh\_key | SSH Public Key |
| ssh\_user | SSH User |
| user\_data | User data to be used on these instances (cloud-init) |
| zone\_list | Element by zone list |

