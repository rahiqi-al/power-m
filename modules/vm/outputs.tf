output "vm_name" {
  value = nutanix_virtual_machine.ubuntu_vm.name
  depends_on = [nutanix_virtual_machine.ubuntu_vm]
}