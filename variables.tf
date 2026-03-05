# Resource creation control variables
variable "create_resource_directory" {
  description = "Whether to create a new resource directory. If false, an existing resource directory ID must be provided."
  type        = bool
  default     = true
}

variable "create_folder" {
  description = "Whether to create a folder in the resource directory."
  type        = bool
  default     = false
}

variable "create_account" {
  description = "Whether to create a member account in the resource directory."
  type        = bool
  default     = false
}

variable "create_resource_group" {
  description = "Whether to create a resource group."
  type        = bool
  default     = false
}

variable "create_policy" {
  description = "Whether to create a custom policy."
  type        = bool
  default     = false
}

variable "create_policy_attachment" {
  description = "Whether to create a policy attachment."
  type        = bool
  default     = false
}

variable "create_control_policy" {
  description = "Whether to create a control policy."
  type        = bool
  default     = false
}

variable "create_control_policy_attachment" {
  description = "Whether to create a control policy attachment."
  type        = bool
  default     = false
}

variable "create_role" {
  description = "Whether to create a resource manager role."
  type        = bool
  default     = false
}

# External resource IDs (used when create_* = false)
variable "resource_directory_id" {
  description = "The ID of an existing resource directory. Required when create_resource_directory is false."
  type        = string
  default     = null
}

variable "folder_id" {
  description = "The ID of an existing folder. Required when create_folder is false."
  type        = string
  default     = null
}

# Resource configuration objects
variable "resource_directory_config" {
  description = "Configuration for the resource directory. The attribute 'status' is required."
  type = object({
    status                                  = string
    member_deletion_status                  = optional(string, "Disabled")
    member_account_display_name_sync_status = optional(string, "Disabled")
  })
  default = {
    status = "Enabled"
  }
}

variable "folder_config" {
  description = "Configuration for the folder. The attribute 'folder_name' is required."
  type = object({
    folder_name      = string
    parent_folder_id = optional(string, null)
  })
  default = {
    folder_name = null
  }
}

variable "account_config" {
  description = "Configuration for the member account. The attribute 'display_name' is required."
  type = object({
    display_name        = string
    account_name_prefix = optional(string, null)
    payer_account_id    = optional(string, null)
    resell_account_type = optional(string, "resell")
  })
  default = {
    display_name = null
  }
}

variable "resource_group_config" {
  description = "Configuration for the resource group. The attributes 'resource_group_name' and 'display_name' are required."
  type = object({
    resource_group_name = string
    display_name        = string
  })
  default = {
    resource_group_name = null
    display_name        = null
  }
}

variable "policy_config" {
  description = "Configuration for the custom policy. The attribute 'policy_name' is required."
  type = object({
    policy_name     = string
    description     = optional(string, "Custom policy created by terraform")
    policy_document = optional(string, null)
  })
  default = {
    policy_name = null
  }
}

variable "policy_attachment_config" {
  description = "Configuration for policy attachment. The attributes 'policy_type', 'principal_name', and 'principal_type' are required."
  type = object({
    policy_name       = optional(string, null)
    policy_type       = string
    principal_name    = string
    principal_type    = string
    resource_group_id = optional(string, null)
  })
  default = {
    policy_type    = "Custom"
    principal_name = null
    principal_type = "IMSUser"
  }
}

variable "control_policy_config" {
  description = "Configuration for the control policy. The attributes 'control_policy_name' and 'effect_scope' are required."
  type = object({
    control_policy_name = string
    description         = optional(string, "Control policy created by terraform")
    effect_scope        = string
    policy_document     = optional(string, null)
  })
  default = {
    control_policy_name = null
    effect_scope        = "RAM"
  }
}

variable "control_policy_attachment_config" {
  description = "Configuration for control policy attachment. The attributes 'policy_id' and 'target_id' are required."
  type = object({
    policy_id = string
    target_id = string
  })
  default = {
    policy_id = null
    target_id = null
  }
}

variable "role_config" {
  description = "Configuration for the resource manager role. The attributes 'role_name' and 'assume_role_policy_document' are required."
  type = object({
    role_name                   = string
    assume_role_policy_document = string
    description                 = optional(string, "Resource manager role created by terraform")
    max_session_duration        = optional(number, 3600)
  })
  default = {
    role_name                   = null
    assume_role_policy_document = null
  }
}


# Common tags
variable "common_tags" {
  description = "Common tags to be applied to all resources."
  type        = map(string)
  default     = {}
}