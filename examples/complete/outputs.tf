output "resource_directory_id" {
  description = "The ID of the resource directory"
  value       = module.resourcemanager.resource_directory_id
}

output "resource_directory_master_account_id" {
  description = "The ID of the master account"
  value       = module.resourcemanager.resource_directory_master_account_id
}

output "folder_id" {
  description = "The ID of the folder"
  value       = module.resourcemanager.folder_id
}

output "account_id" {
  description = "The ID of the member account"
  value       = module.resourcemanager.account_id
}

output "account_status" {
  description = "Member joining status"
  value       = module.resourcemanager.account_status
}

output "resource_group_id" {
  description = "The ID of the resource group"
  value       = module.resourcemanager.resource_group_id
}

output "policy_id" {
  description = "The ID of the policy"
  value       = module.resourcemanager.policy_id
}

output "policy_name" {
  description = "The name of the policy"
  value       = module.resourcemanager.policy_name
}

output "policy_attachment_id" {
  description = "The ID of the policy attachment"
  value       = module.resourcemanager.policy_attachment_id
}

output "control_policy_id" {
  description = "The ID of the control policy"
  value       = module.resourcemanager.control_policy_id
}

output "role_id" {
  description = "The ID of the role"
  value       = module.resourcemanager.role_id
}

output "role_name" {
  description = "The name of the role"
  value       = module.resourcemanager.role_name
}

output "role_arn" {
  description = "The resource descriptor of the role"
  value       = module.resourcemanager.role_arn
}