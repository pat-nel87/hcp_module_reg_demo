# modules/vnet/outputs.tf

output "vnet_id" {
  description = "ID of the virtual network"
  value       = azurerm_virtual_network.this.id
}

output "vnet_name" {
  description = "Name of the virtual network"
  value       = azurerm_virtual_network.this.name
}

output "subnet_ids" {
  description = "Map of subnet names to IDs"
  value       = { for k, v in azurerm_subnet.subnets : k => v.id }
}

output "subnet_cidrs" {
  description = "Map of subnet names to CIDR blocks"
  value       = { for k, v in azurerm_subnet.subnets : k => v.address_prefixes[0] }
}