output "shore_telemetry_vault_id" {
  value       = module.shore_hq.telemetry_vault_id
  description = "The globally unique identifier for the encrypted deep-sea telemetry storage vault"
}

output "coast_vpc_network_id" {
  value       = module.mombasa_port_edge.coast_network_id
  description = "The operational identifier for the secure Mombasa port receiving virtual private network"
}
