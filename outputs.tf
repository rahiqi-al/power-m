output "vm_name" {
  value = try(module.vm.vm_name, "VM creation failed")
  depends_on = [module.vm]
}
