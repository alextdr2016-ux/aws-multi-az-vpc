# AWS Multi-AZ VPC Infrastructure

Production-ready AWS VPC architecture with Multi-AZ high availability, automated with Terraform and CI/CD.

## 🏗️ Architecture

```
VPC (10.0.0.0/16) - 3 Availability Zones
├── Public Subnets (3)
│   ├── eu-north-1a: 10.0.1.0/24
│   ├── eu-north-1b: 10.0.2.0/24
│   └── eu-north-1c: 10.0.3.0/24
├── Private Subnets (3) - Application Tier
│   ├── eu-north-1a: 10.0.11.0/24
│   ├── eu-north-1b: 10.0.12.0/24
│   └── eu-north-1c: 10.0.13.0/24
└── Database Subnets (3)
    ├── eu-north-1a: 10.0.21.0/24
    ├── eu-north-1b: 10.0.22.0/24
    └── eu-north-1c: 10.0.23.0/24
```

## ✨ Features

- ✅ **High Availability**: 3 Availability Zones
- ✅ **Network Segmentation**: Public, Private, and Database tiers
- ✅ **NAT Gateways**: One per AZ for redundancy
- ✅ **VPC Flow Logs**: Network traffic monitoring
- ✅ **Infrastructure as Code**: Fully managed with Terraform
- ✅ **CI/CD Pipeline**: Automated with GitHub Actions
- ✅ **Modular Design**: Reusable Terraform modules

## 🛠️ Tech Stack

- **Cloud**: AWS
- **IaC**: Terraform
- **CI/CD**: GitHub Actions
- **Version Control**: Git

## 📊 Resources

| Resource         | Quantity | Purpose                  |
| ---------------- | -------- | ------------------------ |
| VPC              | 1        | Network isolation        |
| Subnets          | 9        | 3 tiers × 3 AZ           |
| NAT Gateways     | 3        | HA outbound connectivity |
| Internet Gateway | 1        | Public internet access   |
| Route Tables     | 7        | Traffic routing          |
| Elastic IPs      | 3        | NAT Gateway IPs          |
| CloudWatch Logs  | 1        | VPC Flow Logs            |
| IAM Roles        | 1        | Flow Logs permissions    |

## 🚀 Getting Started

### Prerequisites

- Terraform >= 1.0
- AWS CLI configured
- AWS Account

### Local Deployment

```bash
# Initialize
terraform init

# Plan
terraform plan

# Apply
terraform apply

# Destroy
terraform destroy
```

## 🤖 CI/CD Pipeline

### Workflows

**CI Pipeline** (on Pull Request):

- Terraform format check
- Terraform validation
- Terraform plan

**CD Pipeline** (Manual Trigger):

- Plan infrastructure
- Apply infrastructure
- Destroy infrastructure

### GitHub Secrets Required

```
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
```

## 💡 What I Learned

- Multi-AZ architecture design for high availability
- VPC networking and subnet segmentation
- NAT Gateway redundancy patterns
- Terraform module development
- CI/CD for infrastructure automation
- Cost optimization strategies

## 💰 Cost Considerations

- 3 NAT Gateways: ~$99/month (HA configuration)
- Alternative: Single NAT Gateway: ~$33/month
- VPC Flow Logs: ~$0.50/GB
- Data transfer: ~$0.045/GB

## 📄 License

MIT License

## 👤 Author

**Alexandru Tudor** - Aspiring Cloud Engineer

- LinkedIn: [Your LinkedIn]
- GitHub: [@alextdr2016-ux](https://github.com/alextdr2016-ux)

---

⭐ Learning cloud engineering by building real projects!
