terraform {
  required_providers {
    nutanix = {
      source  = "nutanix/nutanix"
      version = "~> 2.2.0"
    }
  }
}

data "nutanix_clusters" "cluster" {
  filter = "name==${var.cluster_name}"
}

data "nutanix_subnets" "subnet" {
  filter = "name==${var.subnet_name}"
}

data "nutanix_images" "image" {
  filter = "name==${var.image_name}"
}

resource "nutanix_virtual_machine" "ubuntu_vm" {
  name                 = var.vm_name
  cluster_id           = data.nutanix_clusters.cluster.entities[0].id
  num_vcpus_per_socket = var.vcpus
  num_sockets          = 1
  memory_size_mib      = var.memory

  disk_list {
    data_source_reference = {
      kind = "image"
      uuid = data.nutanix_images.image.entities[0].id
    }
    device_properties {
      device_type = "DISK"
    }
  }

  nic_list {
    subnet_uuid = data.nutanix_subnets.subnet.entities[0].id
  }
}
