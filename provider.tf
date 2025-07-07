# provider "morpheus" {
#   url      = var.morpheus_url      
#   username = var.morpheus_username 
#   password = var.morpheus_password 
# }


provider "nutanix" {
  username = var.nutanix_username
  password = var.nutanix_password
  endpoint = var.nutanix_endpoint
  insecure = true
}
