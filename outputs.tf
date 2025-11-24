# ========================================
# VPC Outputs
# ========================================
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc_multi_az.vpc_id
}

output "vpc_cidr" {
  description = "The CIDR block of the VPC"
  value       = module.vpc_multi_az.vpc_cidr
}

# ========================================
# Subnet Outputs
# ========================================
output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = module.vpc_multi_az.public_subnet_ids
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = module.vpc_multi_az.private_subnet_ids
}

output "database_subnet_ids" {
  description = "List of database subnet IDs"
  value       = module.vpc_multi_az.database_subnet_ids
}

# ========================================
# NAT Gateway Outputs
# ========================================
output "nat_gateway_ids" {
  description = "List of NAT Gateway IDs"
  value       = module.vpc_multi_az.nat_gateway_ids
}

output "nat_eip_public_ips" {
  description = "List of NAT Gateway public IPs"
  value       = module.vpc_multi_az.nat_eip_public_ips
}

# ========================================
# Summary Output
# ========================================
output "vpc_summary" {
  description = "VPC configuration summary"
  value       = module.vpc_multi_az.vpc_summary
}