# variable "morpheus_url" {}
# variable "morpheus_username" {}
# variable "morpheus_password" {}
variable "nutanix_username" {
  type = string
  sensitive = true
}
variable "nutanix_password" {
  type = string
  sensitive = true
}
variable "nutanix_endpoint" {}
variable "cluster_name" {}
variable "subnet_name" {}
variable "image_name" {}
variable "vm_name" {}
variable "memory" {
  default = 2048
}
variable "vcpus" {
  default = 1
}
