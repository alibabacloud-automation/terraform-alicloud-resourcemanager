# Local values for resource organization
locals {
  # Resource directory ID - use created or existing
  this_resource_directory_id = var.create_resource_directory ? alicloud_resource_manager_resource_directory.directory[0].id : var.resource_directory_id

  # Folder ID - use created or existing
  this_folder_id = var.create_folder ? alicloud_resource_manager_folder.folder[0].id : var.folder_id

}

# Resource Directory - Enterprise resource organization root
resource "alicloud_resource_manager_resource_directory" "directory" {
  count                                   = var.create_resource_directory ? 1 : 0
  status                                  = var.resource_directory_config.status
  member_deletion_status                  = var.resource_directory_config.member_deletion_status
  member_account_display_name_sync_status = var.resource_directory_config.member_account_display_name_sync_status
}

# Folder - Organizational unit for resource management
resource "alicloud_resource_manager_folder" "folder" {
  count            = var.create_folder ? 1 : 0
  folder_name      = var.folder_config.folder_name
  parent_folder_id = var.folder_config.parent_folder_id
  tags             = var.common_tags
}

# Member Account - Resource account within the directory
resource "alicloud_resource_manager_account" "account" {
  count               = var.create_account ? 1 : 0
  display_name        = var.account_config.display_name
  folder_id           = local.this_folder_id
  account_name_prefix = var.account_config.account_name_prefix
  payer_account_id    = var.account_config.payer_account_id
  resell_account_type = var.account_config.resell_account_type
  tags                = var.common_tags
}

# Resource Group - Logical grouping of resources
resource "alicloud_resource_manager_resource_group" "group" {
  count               = var.create_resource_group ? 1 : 0
  resource_group_name = var.resource_group_config.resource_group_name
  display_name        = var.resource_group_config.display_name
  tags                = var.common_tags
}

# Policy - Custom access control policy
resource "alicloud_resource_manager_policy" "policy" {
  count           = var.create_policy ? 1 : 0
  policy_name     = var.policy_config.policy_name
  policy_document = var.policy_config.policy_document
  description     = var.policy_config.description
}

# Policy Attachment - Bind policy to resource group
resource "alicloud_resource_manager_policy_attachment" "attachment" {
  count             = var.create_policy_attachment ? 1 : 0
  policy_name       = var.create_policy ? alicloud_resource_manager_policy.policy[0].policy_name : var.policy_attachment_config.policy_name
  policy_type       = var.policy_attachment_config.policy_type
  principal_name    = var.policy_attachment_config.principal_name
  principal_type    = var.policy_attachment_config.principal_type
  resource_group_id = var.create_resource_group ? alicloud_resource_manager_resource_group.group[0].id : var.policy_attachment_config.resource_group_id
}

# Control Policy - Advanced access control policy
resource "alicloud_resource_manager_control_policy" "control_policy" {
  count               = var.create_control_policy ? 1 : 0
  control_policy_name = var.control_policy_config.control_policy_name
  description         = var.control_policy_config.description
  effect_scope        = var.control_policy_config.effect_scope
  policy_document     = var.control_policy_config.policy_document
  tags                = var.common_tags
}

# Control Policy Attachment - Bind control policy to folder or account
resource "alicloud_resource_manager_control_policy_attachment" "control_attachment" {
  count     = var.create_control_policy_attachment ? 1 : 0
  policy_id = var.create_control_policy ? alicloud_resource_manager_control_policy.control_policy[0].id : var.control_policy_attachment_config.policy_id
  target_id = var.create_folder ? alicloud_resource_manager_folder.folder[0].id : var.control_policy_attachment_config.target_id
}

# Role - Service-linked role for resource management
resource "alicloud_resource_manager_role" "role" {
  count                       = var.create_role ? 1 : 0
  role_name                   = var.role_config.role_name
  assume_role_policy_document = var.role_config.assume_role_policy_document
  description                 = var.role_config.description
  max_session_duration        = var.role_config.max_session_duration
}