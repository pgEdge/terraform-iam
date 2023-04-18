terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

module "pgedge_role" {
  source      = "../../modules/aws/pgedge-role"
  external_id = "your-value-here"
  trusted_principals = [
    "arn:aws:iam::631662578350:root"
  ]
}

output "role_arn" {
  description = "IAM role ARN"
  value       = module.pgedge_role.role_arn
}
