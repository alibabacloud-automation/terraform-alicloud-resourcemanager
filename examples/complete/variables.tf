variable "region" {
  description = "The Alicloud region"
  type        = string
  default     = "cn-hangzhou"
}

variable "folder_name" {
  description = "The name of the folder"
  type        = string
  default     = "example-folder"
}

variable "account_display_name" {
  description = "The display name of the member account"
  type        = string
  default     = "example-account"
}

variable "account_name_prefix" {
  description = "The name prefix of the member account"
  type        = string
  default     = "example"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "example-resource-group"
}

variable "resource_group_display_name" {
  description = "The display name of the resource group"
  type        = string
  default     = "Example Resource Group"
}

variable "policy_name" {
  description = "The name of the custom policy"
  type        = string
  default     = "example-policy"
}

variable "policy_description" {
  description = "The description of the custom policy"
  type        = string
  default     = "Example custom policy for resource management"
}

variable "control_policy_name" {
  description = "The name of the control policy"
  type        = string
  default     = "example-control-policy"
}

variable "control_policy_description" {
  description = "The description of the control policy"
  type        = string
  default     = "Example control policy for access control"
}

variable "role_name" {
  description = "The name of the resource manager role"
  type        = string
  default     = "example-role"
}

variable "role_description" {
  description = "The description of the resource manager role"
  type        = string
  default     = "Example resource manager role"
}


variable "policy_document" {
  description = "Custom policy document in JSON format for the policy resource"
  type        = string
  default     = <<EOF
{
  "Version": "1",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ecs:DescribeInstances",
        "ecs:DescribeRegions"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

variable "control_policy_document" {
  description = "Custom control policy document in JSON format for the control policy resource"
  type        = string
  default     = <<EOF
{
  "Version": "1",
  "Statement": [
    {
      "Effect": "Deny",
      "Action": [
        "ram:CreateUser",
        "ram:DeleteUser"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

variable "common_tags" {
  description = "Common tags to be applied to all resources"
  type        = map(string)
  default = {
    Environment = "example"
    Project     = "terraform-alicloud-resourcemanager"
  }
}

variable "ram_user_name" {
  description = "The base name of the RAM user to create (a random suffix will be added for uniqueness)"
  type        = string
  default     = "example-ram-user"
}

