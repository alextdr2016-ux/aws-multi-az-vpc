# ========================================
# VPC Outputs
# ========================================
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.main.cidr_block
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = aws_vpc.main.arn
}

# ========================================
# Internet Gateway Outputs
# ========================================
output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.main.id
}

# ========================================
# Public Subnet Outputs
# ========================================
output "public_subnet_ids" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public[*].id
}

output "public_subnet_cidrs" {
  description = "List of CIDR blocks of public subnets"
  value       = aws_subnet.public[*].cidr_block
}

output "public_subnet_azs" {
  description = "List of Availability Zones of public subnets"
  value       = aws_subnet.public[*].availability_zone
}

# ========================================
# Private Subnet Outputs
# ========================================
output "private_subnet_ids" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.private[*].id
}

output "private_subnet_cidrs" {
  description = "List of CIDR blocks of private subnets"
  value       = aws_subnet.private[*].cidr_block
}

output "private_subnet_azs" {
  description = "List of Availability Zones of private subnets"
  value       = aws_subnet.private[*].availability_zone
}

# ========================================
# Database Subnet Outputs
# ========================================
output "database_subnet_ids" {
  description = "List of IDs of database subnets"
  value       = aws_subnet.database[*].id
}

output "database_subnet_cidrs" {
  description = "List of CIDR blocks of database subnets"
  value       = aws_subnet.database[*].cidr_block
}

output "database_subnet_azs" {
  description = "List of Availability Zones of database subnets"
  value       = aws_subnet.database[*].availability_zone
}

# Database Subnet Group for RDS (useful for later)
output "database_subnet_group_name" {
  description = "Name of database subnet group (for RDS)"
  value       = "${var.vpc_name}-db-subnet-group"
}

# ========================================
# NAT Gateway Outputs
# ========================================
output "nat_gateway_ids" {
  description = "List of NAT Gateway IDs"
  value       = aws_nat_gateway.main[*].id
}

output "nat_eip_public_ips" {
  description = "List of Elastic IP addresses associated with NAT Gateways"
  value       = aws_eip.nat[*].public_ip
}

# ========================================
# Route Table Outputs
# ========================================
output "public_route_table_id" {
  description = "ID of public route table"
  value       = aws_route_table.public.id
}

output "private_route_table_ids" {
  description = "List of IDs of private route tables"
  value       = aws_route_table.private[*].id
}

output "database_route_table_ids" {
  description = "List of IDs of database route tables"
  value       = aws_route_table.database[*].id
}

# ========================================
# VPC Flow Logs Outputs
# ========================================
output "vpc_flow_log_id" {
  description = "The ID of the VPC Flow Log"
  value       = var.enable_flow_logs ? aws_flow_log.main[0].id : null
}

output "vpc_flow_log_cloudwatch_log_group" {
  description = "The CloudWatch Log Group for VPC Flow Logs"
  value       = var.enable_flow_logs ? aws_cloudwatch_log_group.flow_log[0].name : null
}

# ========================================
# Availability Zones Output
# ========================================
output "availability_zones" {
  description = "List of Availability Zones used"
  value       = var.availability_zones
}

# ========================================
# Summary Output (useful for debugging)
# ========================================
output "vpc_summary" {
  description = "Summary of VPC configuration"
  value = {
    vpc_id                = aws_vpc.main.id
    vpc_cidr              = aws_vpc.main.cidr_block
    availability_zones    = var.availability_zones
    public_subnet_count   = length(aws_subnet.public)
    private_subnet_count  = length(aws_subnet.private)
    database_subnet_count = length(aws_subnet.database)
    nat_gateway_count     = length(aws_nat_gateway.main)
    single_nat_gateway    = var.single_nat_gateway
  }
}