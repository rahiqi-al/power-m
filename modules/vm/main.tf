terraform {
  required_providers {
    nutanix = {
      source  = "nutanix/nutanix"
      version = "~> 2.2.0"
    }
  }
}

data "nutanix_clusters" "all_clusters" {}

data "nutanix_subnets" "all_subnets" {}

data "nutanix_image" "image" {
  image_name = var.image_name
}

resource "nutanix_virtual_machine" "ubuntu_vm" {
  name                 = var.vm_name
  cluster_uuid         = try([for c in data.nutanix_clusters.all_clusters.entities : c.metadata.uuid if c.name == var.cluster_name][0], null)
  num_vcpus_per_socket = var.vcpus
  num_sockets          = 1
  memory_size_mib      = var.memory

  disk_list {
    data_source_reference = {
      kind = "image"
      uuid = data.nutanix_image.image.id  
    }
    device_properties {
      device_type = "DISK"
    }
  }

  nic_list {
    subnet_uuid = try([for s in data.nutanix_subnets.all_subnets.entities : s.metadata.uuid if s.name == var.subnet_name][0], null)
  }
}
