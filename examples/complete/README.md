# Complete Example

This example demonstrates the complete usage of the terraform-alicloud-resourcemanager module.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which can cost money. Run `terraform destroy` when you don't need these resources.


## Features

This example creates a complete Resource Manager setup including:

- **Resource Directory**: The root organizational unit for enterprise resource management
- **Folder**: Organizational unit within the resource directory for grouping accounts
- **Member Account**: A resource account within the directory for isolated resource management
- **Resource Group**: Logical grouping of resources for better organization and access control
- **Custom Policy**: Access control policy defining permissions for resource operations
- **Policy Attachment**: Binding the custom policy to a principal (RAM user) and resource group
- **Control Policy**: Advanced access control policy for restricting actions within the organization
- **Resource Manager Role**: Service role for resource management operations

## Architecture

The resources are organized in a hierarchical structure:

```
Resource Directory
├── Folder (optional parent)
│   └── Member Account
├── Resource Group
├── Custom Policy → Policy Attachment → Principal (RAM User)
├── Control Policy → Control Policy Attachment → Folder/Account
└── Resource Manager Role
```

## Notes

- This example requires appropriate permissions to create Resource Directory and manage organizational resources
- Some resources like Resource Directory can only be created once per account
- Member accounts creation may require additional verification steps
- Policy attachments require existing RAM users or service principals