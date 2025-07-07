module "vm" {
  source        = "./modules/vm"
  vm_name       = var.vm_name
  cluster_name  = var.cluster_name
  subnet_name   = var.subnet_name
  image_name    = var.image_name
  memory        = var.memory
  vcpus         = var.vcpus

  providers = {
    nutanix = nutanix
  }
}