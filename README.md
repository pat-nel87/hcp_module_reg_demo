# Azure Virtual Network Terraform Module

A Terraform module for creating Azure Virtual Networks with configurable subnets.

[![Release](https://github.com/pat-nel87/hcp_module_reg_demo/actions/workflows/release.yml/badge.svg)](https://github.com/pat-nel87/hcp_module_reg_demo/actions/workflows/release.yml)
[![semantic-release: conventionalcommits](https://img.shields.io/badge/semantic--release-conventionalcommits-e10079?logo=semantic-release)](https://github.com/semantic-release/semantic-release)

## Usage

```hcl
module "vnet" {
  source = "pat-nel87/vnet/azure"
  
  vnet_name           = "my-vnet"
  resource_group_name = "my-rg"
  location           = "East US"
  address_space      = ["10.0.0.0/16"]
  
  subnets = {
    "web"      = "10.0.1.0/24"
    "app"      = "10.0.2.0/24"
    "database" = "10.0.3.0/24"
  }
  
  tags = {
    Environment = "production"
    Project     = "my-project"
  }
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| azurerm | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | ~> 3.0 |

## Resources

| Name | Type |
|------|------|
| azurerm_virtual_network.this | resource |
| azurerm_subnet.subnets | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| vnet_name | Name of the virtual network | `string` | n/a | yes |
| resource_group_name | Name of the resource group | `string` | n/a | yes |
| location | Azure region where resources will be created | `string` | n/a | yes |
| address_space | Address space for the virtual network | `list(string)` | `["10.0.0.0/16"]` | no |
| subnets | Map of subnet names to CIDR blocks | `map(string)` | `{"default" = "10.0.1.0/24"}` | no |
| tags | Tags to apply to resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| vnet_id | ID of the virtual network |
| vnet_name | Name of the virtual network |
| subnet_ids | Map of subnet names to IDs |
| subnet_cidrs | Map of subnet names to CIDR blocks |

## Contributing

This project uses [Conventional Commits](https://www.conventionalcommits.org/) for commit messages and [semantic-release](https://semantic-release.gitbook.io/) for automated versioning and releases.

### Commit Message Format

Use the following format for commit messages:

- `feat:` for new features (triggers minor version bump)
- `fix:` for bug fixes (triggers patch version bump)
- `docs:` for documentation changes
- `style:` for formatting changes
- `refactor:` for code refactoring
- `test:` for adding tests
- `chore:` for maintenance tasks

Add `BREAKING CHANGE:` in the commit body or use `!` after the type (e.g., `feat!:`) to trigger a major version bump.

### Example Commits

```
feat: add support for network security groups
fix: correct subnet address validation
docs: update usage examples
feat!: change module structure (BREAKING CHANGE)
```

## License

Apache 2.0 Licensed. See [LICENSE](LICENSE) for full details.
