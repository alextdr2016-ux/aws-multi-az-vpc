terraform {
  backend "s3" {
    bucket         = "alex-terraform-state-vpc-multi-az"
    key            = "vpc-multi-az/terraform.tfstate"
    region         = "eu-north-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}
