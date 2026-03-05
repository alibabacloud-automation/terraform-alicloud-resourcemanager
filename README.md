Terraform module for Alibaba Cloud Resource Manager

# terraform-alicloud-resourcemanager

English | [简体中文](https://github.com/alibabacloud-automation/terraform-alicloud-resourcemanager/blob/main/README-CN.md)

Terraform module which creates Resource Manager resources on Alibaba Cloud. This module helps you to establish enterprise-level resource organization and management capabilities by providing a comprehensive set of Resource Manager components including resource directories, folders, member accounts, resource groups, policies, and roles. It enables centralized governance, access control, and resource organization for large-scale cloud deployments. For more information about Resource Manager, see [Resource Management](https://www.alibabacloud.com/help/en/resource-management/).

## Usage

This module provides flexible resource creation control, allowing you to create only the resources you need or use existing resources. Here's a basic example:

```terraform
module "resourcemanager" {
  source = "alibabacloud-automation/resourcemanager/alicloud"

  # Resource Directory
  create_resource_directory = true
  resource_directory_config = {
    status                 = "Enabled"
    member_deletion_status = "Enabled"
  }

  # Folder
  create_folder = true
  folder_config = {
    folder_name = "production-folder"
  }

  # Resource Group
  create_resource_group = true
  resource_group_config = {
    resource_group_name = "production-rg"
    display_name        = "Production Resource Group"
  }

  # Policy
  create_policy = true
  policy_config = {
    policy_name = "production-policy"
    description = "Policy for production resources"
  }
}
```

## Examples

* [Complete Example](https://github.com/alibabacloud-automation/terraform-alicloud-resourcemanager/tree/main/examples/complete)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.212.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | 1.272.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alicloud_resource_manager_account.account](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/resource_manager_account) | resource |
| [alicloud_resource_manager_control_policy.control_policy](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/resource_manager_control_policy) | resource |
| [alicloud_resource_manager_control_policy_attachment.control_attachment](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/resource_manager_control_policy_attachment) | resource |
| [alicloud_resource_manager_folder.folder](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/resource_manager_folder) | resource |
| [alicloud_resource_manager_policy.policy](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/resource_manager_policy) | resource |
| [alicloud_resource_manager_policy_attachment.attachment](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/resource_manager_policy_attachment) | resource |
| [alicloud_resource_manager_resource_directory.directory](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/resource_manager_resource_directory) | resource |
| [alicloud_resource_manager_resource_group.group](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/resource_manager_resource_group) | resource |
| [alicloud_resource_manager_role.role](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/resource_manager_role) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_config"></a> [account\_config](#input\_account\_config) | Configuration for the member account. The attribute 'display\_name' is required. | <pre>object({<br/>    display_name        = string<br/>    account_name_prefix = optional(string, null)<br/>    payer_account_id    = optional(string, null)<br/>    resell_account_type = optional(string, "resell")<br/>  })</pre> | <pre>{<br/>  "display_name": null<br/>}</pre> | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Common tags to be applied to all resources. | `map(string)` | `{}` | no |
| <a name="input_control_policy_attachment_config"></a> [control\_policy\_attachment\_config](#input\_control\_policy\_attachment\_config) | Configuration for control policy attachment. The attributes 'policy\_id' and 'target\_id' are required. | <pre>object({<br/>    policy_id = string<br/>    target_id = string<br/>  })</pre> | <pre>{<br/>  "policy_id": null,<br/>  "target_id": null<br/>}</pre> | no |
| <a name="input_control_policy_config"></a> [control\_policy\_config](#input\_control\_policy\_config) | Configuration for the control policy. The attributes 'control\_policy\_name' and 'effect\_scope' are required. | <pre>object({<br/>    control_policy_name = string<br/>    description         = optional(string, "Control policy created by terraform")<br/>    effect_scope        = string<br/>    policy_document     = optional(string, null)<br/>  })</pre> | <pre>{<br/>  "control_policy_name": null,<br/>  "effect_scope": "RAM"<br/>}</pre> | no |
| <a name="input_create_account"></a> [create\_account](#input\_create\_account) | Whether to create a member account in the resource directory. | `bool` | `false` | no |
| <a name="input_create_control_policy"></a> [create\_control\_policy](#input\_create\_control\_policy) | Whether to create a control policy. | `bool` | `false` | no |
| <a name="input_create_control_policy_attachment"></a> [create\_control\_policy\_attachment](#input\_create\_control\_policy\_attachment) | Whether to create a control policy attachment. | `bool` | `false` | no |
| <a name="input_create_folder"></a> [create\_folder](#input\_create\_folder) | Whether to create a folder in the resource directory. | `bool` | `false` | no |
| <a name="input_create_policy"></a> [create\_policy](#input\_create\_policy) | Whether to create a custom policy. | `bool` | `false` | no |
| <a name="input_create_policy_attachment"></a> [create\_policy\_attachment](#input\_create\_policy\_attachment) | Whether to create a policy attachment. | `bool` | `false` | no |
| <a name="input_create_resource_directory"></a> [create\_resource\_directory](#input\_create\_resource\_directory) | Whether to create a new resource directory. If false, an existing resource directory ID must be provided. | `bool` | `true` | no |
| <a name="input_create_resource_group"></a> [create\_resource\_group](#input\_create\_resource\_group) | Whether to create a resource group. | `bool` | `false` | no |
| <a name="input_create_role"></a> [create\_role](#input\_create\_role) | Whether to create a resource manager role. | `bool` | `false` | no |
| <a name="input_folder_config"></a> [folder\_config](#input\_folder\_config) | Configuration for the folder. The attribute 'folder\_name' is required. | <pre>object({<br/>    folder_name      = string<br/>    parent_folder_id = optional(string, null)<br/>  })</pre> | <pre>{<br/>  "folder_name": null<br/>}</pre> | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The ID of an existing folder. Required when create\_folder is false. | `string` | `null` | no |
| <a name="input_policy_attachment_config"></a> [policy\_attachment\_config](#input\_policy\_attachment\_config) | Configuration for policy attachment. The attributes 'policy\_type', 'principal\_name', and 'principal\_type' are required. | <pre>object({<br/>    policy_name       = optional(string, null)<br/>    policy_type       = string<br/>    principal_name    = string<br/>    principal_type    = string<br/>    resource_group_id = optional(string, null)<br/>  })</pre> | <pre>{<br/>  "policy_type": "Custom",<br/>  "principal_name": null,<br/>  "principal_type": "IMSUser"<br/>}</pre> | no |
| <a name="input_policy_config"></a> [policy\_config](#input\_policy\_config) | Configuration for the custom policy. The attribute 'policy\_name' is required. | <pre>object({<br/>    policy_name     = string<br/>    description     = optional(string, "Custom policy created by terraform")<br/>    policy_document = optional(string, null)<br/>  })</pre> | <pre>{<br/>  "policy_name": null<br/>}</pre> | no |
| <a name="input_resource_directory_config"></a> [resource\_directory\_config](#input\_resource\_directory\_config) | Configuration for the resource directory. The attribute 'status' is required. | <pre>object({<br/>    status                                  = string<br/>    member_deletion_status                  = optional(string, "Disabled")<br/>    member_account_display_name_sync_status = optional(string, "Disabled")<br/>  })</pre> | <pre>{<br/>  "status": "Enabled"<br/>}</pre> | no |
| <a name="input_resource_directory_id"></a> [resource\_directory\_id](#input\_resource\_directory\_id) | The ID of an existing resource directory. Required when create\_resource\_directory is false. | `string` | `null` | no |
| <a name="input_resource_group_config"></a> [resource\_group\_config](#input\_resource\_group\_config) | Configuration for the resource group. The attributes 'resource\_group\_name' and 'display\_name' are required. | <pre>object({<br/>    resource_group_name = string<br/>    display_name        = string<br/>  })</pre> | <pre>{<br/>  "display_name": null,<br/>  "resource_group_name": null<br/>}</pre> | no |
| <a name="input_role_config"></a> [role\_config](#input\_role\_config) | Configuration for the resource manager role. The attributes 'role\_name' and 'assume\_role\_policy\_document' are required. | <pre>object({<br/>    role_name                   = string<br/>    assume_role_policy_document = string<br/>    description                 = optional(string, "Resource manager role created by terraform")<br/>    max_session_duration        = optional(number, 3600)<br/>  })</pre> | <pre>{<br/>  "assume_role_policy_document": null,<br/>  "role_name": null<br/>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_account_id"></a> [account\_id](#output\_account\_id) | The ID of the member account |
| <a name="output_account_join_method"></a> [account\_join\_method](#output\_account\_join\_method) | Ways for members to join the resource directory |
| <a name="output_account_join_time"></a> [account\_join\_time](#output\_account\_join\_time) | The time when the member joined the resource directory |
| <a name="output_account_status"></a> [account\_status](#output\_account\_status) | Member joining status |
| <a name="output_control_policy_attachment_id"></a> [control\_policy\_attachment\_id](#output\_control\_policy\_attachment\_id) | The ID of the control policy attachment |
| <a name="output_control_policy_create_time"></a> [control\_policy\_create\_time](#output\_control\_policy\_create\_time) | The time when the control policy was created |
| <a name="output_control_policy_id"></a> [control\_policy\_id](#output\_control\_policy\_id) | The ID of the control policy |
| <a name="output_folder_create_time"></a> [folder\_create\_time](#output\_folder\_create\_time) | The time when the folder was created |
| <a name="output_folder_id"></a> [folder\_id](#output\_folder\_id) | The ID of the folder |
| <a name="output_policy_attachment_id"></a> [policy\_attachment\_id](#output\_policy\_attachment\_id) | The ID of the policy attachment |
| <a name="output_policy_id"></a> [policy\_id](#output\_policy\_id) | The ID of the policy |
| <a name="output_policy_name"></a> [policy\_name](#output\_policy\_name) | The name of the policy |
| <a name="output_policy_type"></a> [policy\_type](#output\_policy\_type) | The type of the policy |
| <a name="output_resource_directory_id"></a> [resource\_directory\_id](#output\_resource\_directory\_id) | The ID of the resource directory |
| <a name="output_resource_directory_master_account_id"></a> [resource\_directory\_master\_account\_id](#output\_resource\_directory\_master\_account\_id) | The ID of the master account |
| <a name="output_resource_directory_master_account_name"></a> [resource\_directory\_master\_account\_name](#output\_resource\_directory\_master\_account\_name) | The name of the master account |
| <a name="output_resource_directory_root_folder_id"></a> [resource\_directory\_root\_folder\_id](#output\_resource\_directory\_root\_folder\_id) | The ID of the root folder |
| <a name="output_resource_group_account_id"></a> [resource\_group\_account\_id](#output\_resource\_group\_account\_id) | The ID of the Alibaba Cloud account to which the resource group belongs |
| <a name="output_resource_group_id"></a> [resource\_group\_id](#output\_resource\_group\_id) | The ID of the resource group |
| <a name="output_resource_group_status"></a> [resource\_group\_status](#output\_resource\_group\_status) | The status of the resource group |
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | The resource descriptor of the role |
| <a name="output_role_id"></a> [role\_id](#output\_role\_id) | The ID of the role |
| <a name="output_role_name"></a> [role\_name](#output\_role\_name) | The name of the role |
| <a name="output_role_update_date"></a> [role\_update\_date](#output\_role\_update\_date) | Role update time |
| <a name="output_this_folder_id"></a> [this\_folder\_id](#output\_this\_folder\_id) | The ID of the folder (created or existing) |
| <a name="output_this_resource_directory_id"></a> [this\_resource\_directory\_id](#output\_this\_resource\_directory\_id) | The ID of the resource directory (created or existing) |
<!-- END_TF_DOCS -->

## Submit Issues

If you have any problems when using this module, please opening
a [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend opening an issue on this repo.

## Authors

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com).

## License

MIT Licensed. See LICENSE for full details.

## Reference

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)