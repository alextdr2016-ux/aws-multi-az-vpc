# ========================================
# Provider Configuration
# ========================================
provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Project     = "AWS Multi-AZ VPC"
      ManagedBy   = "Terraform"
      Environment = var.environment
      Owner       = "Alexandru Tudor"
    }
  }
}

# ========================================
# VPC Multi-AZ Module
# ========================================
module "vpc_multi_az" {
  source = "./modules/vpc-multi-az"

  # VPC Configuration
  vpc_name = "${var.environment}-vpc-multi-az"
  vpc_cidr = var.vpc_cidr

  # Availability Zones
  availability_zones = var.availability_zones

  # Subnet Configuration
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
  database_subnet_cidrs = var.database_subnet_cidrs

  # NAT Gateway Configuration
  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway

  # DNS Configuration
  enable_dns_hostnames = true
  enable_dns_support   = true

  # VPC Flow Logs
  enable_flow_logs = var.enable_flow_logs

  # Tags
  tags = {
    Environment = var.environment
    Terraform   = "true"
    Purpose     = "Learning Multi-AZ Architecture"
  }
}