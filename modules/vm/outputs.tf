output "vm_name" {
  value = try(nutanix_virtual_machine.ubuntu_vm.name, "VM creation failed")
  depends_on = [nutanix_virtual_machine.ubuntu_vm]
}