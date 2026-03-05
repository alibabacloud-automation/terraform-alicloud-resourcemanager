# Resource Directory outputs
output "resource_directory_id" {
  description = "The ID of the resource directory"
  value       = var.create_resource_directory ? alicloud_resource_manager_resource_directory.directory[0].id : var.resource_directory_id
}

output "resource_directory_master_account_id" {
  description = "The ID of the master account"
  value       = var.create_resource_directory ? alicloud_resource_manager_resource_directory.directory[0].master_account_id : null
}

output "resource_directory_master_account_name" {
  description = "The name of the master account"
  value       = var.create_resource_directory ? alicloud_resource_manager_resource_directory.directory[0].master_account_name : null
}

output "resource_directory_root_folder_id" {
  description = "The ID of the root folder"
  value       = var.create_resource_directory ? alicloud_resource_manager_resource_directory.directory[0].root_folder_id : null
}

# Folder outputs
output "folder_id" {
  description = "The ID of the folder"
  value       = var.create_folder ? alicloud_resource_manager_folder.folder[0].id : var.folder_id
}

output "folder_create_time" {
  description = "The time when the folder was created"
  value       = var.create_folder ? alicloud_resource_manager_folder.folder[0].create_time : null
}

# Account outputs
output "account_id" {
  description = "The ID of the member account"
  value       = var.create_account ? alicloud_resource_manager_account.account[0].id : null
}

output "account_join_method" {
  description = "Ways for members to join the resource directory"
  value       = var.create_account ? alicloud_resource_manager_account.account[0].join_method : null
}

output "account_join_time" {
  description = "The time when the member joined the resource directory"
  value       = var.create_account ? alicloud_resource_manager_account.account[0].join_time : null
}

output "account_status" {
  description = "Member joining status"
  value       = var.create_account ? alicloud_resource_manager_account.account[0].status : null
}

# Resource Group outputs
output "resource_group_id" {
  description = "The ID of the resource group"
  value       = var.create_resource_group ? alicloud_resource_manager_resource_group.group[0].id : null
}

output "resource_group_account_id" {
  description = "The ID of the Alibaba Cloud account to which the resource group belongs"
  value       = var.create_resource_group ? alicloud_resource_manager_resource_group.group[0].account_id : null
}

output "resource_group_status" {
  description = "The status of the resource group"
  value       = var.create_resource_group ? alicloud_resource_manager_resource_group.group[0].status : null
}

# Policy outputs
output "policy_id" {
  description = "The ID of the policy"
  value       = var.create_policy ? alicloud_resource_manager_policy.policy[0].id : null
}

output "policy_name" {
  description = "The name of the policy"
  value       = var.create_policy ? alicloud_resource_manager_policy.policy[0].policy_name : null
}

output "policy_type" {
  description = "The type of the policy"
  value       = var.create_policy ? alicloud_resource_manager_policy.policy[0].policy_type : null
}

# Policy Attachment outputs
output "policy_attachment_id" {
  description = "The ID of the policy attachment"
  value       = var.create_policy_attachment ? alicloud_resource_manager_policy_attachment.attachment[0].id : null
}

# Control Policy outputs
output "control_policy_id" {
  description = "The ID of the control policy"
  value       = var.create_control_policy ? alicloud_resource_manager_control_policy.control_policy[0].id : null
}

output "control_policy_create_time" {
  description = "The time when the control policy was created"
  value       = var.create_control_policy ? alicloud_resource_manager_control_policy.control_policy[0].create_time : null
}

# Control Policy Attachment outputs
output "control_policy_attachment_id" {
  description = "The ID of the control policy attachment"
  value       = var.create_control_policy_attachment ? alicloud_resource_manager_control_policy_attachment.control_attachment[0].id : null
}

# Role outputs
output "role_id" {
  description = "The ID of the role"
  value       = var.create_role ? alicloud_resource_manager_role.role[0].role_id : null
}

output "role_name" {
  description = "The name of the role"
  value       = var.create_role ? alicloud_resource_manager_role.role[0].role_name : null
}

output "role_arn" {
  description = "The resource descriptor of the role"
  value       = var.create_role ? alicloud_resource_manager_role.role[0].arn : null
}

output "role_update_date" {
  description = "Role update time"
  value       = var.create_role ? alicloud_resource_manager_role.role[0].update_date : null
}

# Computed outputs for convenience
output "this_resource_directory_id" {
  description = "The ID of the resource directory (created or existing)"
  value       = local.this_resource_directory_id
}

output "this_folder_id" {
  description = "The ID of the folder (created or existing)"
  value       = local.this_folder_id
}