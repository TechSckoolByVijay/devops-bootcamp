output "resource_group_id" {
  value = module.core_resources.resource_group_id
}


output "stg_account_name" {
  value = module.core_resources.storage_account_name
}

output "webappName" {
  value = module.static_app.webappName
}


# output "acrName" {
#   value = module.containerization.aksName
# }

# output "aksName" {
#   value = module.containerization.aksName
# }
