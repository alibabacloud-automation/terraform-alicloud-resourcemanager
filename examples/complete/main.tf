# Configure the Alicloud Provider
provider "alicloud" {
  region = var.region
}

# Get current account information
data "alicloud_account" "current" {}

# Generate random integer for unique user name
resource "random_integer" "user_suffix" {
  min = 1000
  max = 9999
}

# Create a new RAM user for policy attachment
resource "alicloud_ram_user" "example_user" {
  name = "${var.ram_user_name}-${random_integer.user_suffix.result}"
}

# Complete Resource Manager example
module "resourcemanager" {
  source = "../../"

  ###################
  # Resource Directory
  ###################
  # Note: Disabled because account is already in a resource directory
  create_resource_directory = false
  resource_directory_config = {
    status                                  = "Enabled"
    member_deletion_status                  = "Enabled"
    member_account_display_name_sync_status = "Enabled"
  }

  ###################
  # Folder
  ###################
  create_folder = true
  folder_config = {
    folder_name      = var.folder_name
    parent_folder_id = null
  }

  ###################
  # Member Account
  ###################
  # Note: Disabled due to member account limit
  create_account = false
  account_config = {
    display_name        = var.account_display_name
    account_name_prefix = var.account_name_prefix
    payer_account_id    = null
    resell_account_type = "resell"
  }

  ###################
  # Resource Group
  ###################
  create_resource_group = true
  resource_group_config = {
    resource_group_name = var.resource_group_name
    display_name        = var.resource_group_display_name
  }

  ###################
  # Policy
  ###################
  create_policy = true
  policy_config = {
    policy_name     = var.policy_name
    description     = var.policy_description
    policy_document = var.policy_document
  }

  ###################
  # Policy Attachment
  ###################
  create_policy_attachment = true
  policy_attachment_config = {
    policy_type       = "Custom"
    principal_name    = format("%s@%s.onaliyun.com", alicloud_ram_user.example_user.name, data.alicloud_account.current.id)
    principal_type    = "IMSUser"
    resource_group_id = null
  }

  ###################
  # Control Policy
  ###################
  create_control_policy = true
  control_policy_config = {
    control_policy_name = var.control_policy_name
    description         = var.control_policy_description
    effect_scope        = "RAM"
    policy_document     = var.control_policy_document
  }

  ###################
  # Role
  ###################
  create_role = true
  role_config = {
    role_name = var.role_name
    assume_role_policy_document = jsonencode({
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Principal = {
            RAM = [
              "acs:ram::${data.alicloud_account.current.id}:root"
            ]
          }
        }
      ]
      Version = "1"
    })
    description          = var.role_description
    max_session_duration = 3600
  }

  ###################
  # Common Tags
  ###################
  common_tags = var.common_tags
}