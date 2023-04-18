# terraform-iam

This repository contains a Terraform module and example configuration to
provision an AWS IAM role to grant pgEdge access to provision clusters.

## Prerequisites

You will need the following in order to set up permissions for pgEdge:

- An AWS development account
- Active AWS credentials on your laptop
- Terraform installed (>= v1.0.0)

## Getting Started

1. Sign up for [pgEdge](https://app.pgedge.com).
2. pgEdge support will provide you with the external ID value for your account.
3. Edit [main.tf](./examples/pgedge-aws-permissions/main.tf) and set the
   provided external ID value on line 13.
4. Run Terraform to provision the IAM role. One way to do that is run `make` in
   this directory, which runs `terraform init` and `terraform apply` in the
   correct directory on your behalf.
5. Create a cluster in the pgEdge Cloud UI and provide the IAM role ARN that
   is shown as the output from step 4.

## What Infrastructure is Created?

Using the provided IAM role, pgEdge provisions a secure database cluster
spanning multiple regions in your AWS account. The cloud infrastructure created
for the cluster includes the following resources.

| Service        | Resources                                          | Notes                                                           |
| -------------- | -------------------------------------------------- | --------------------------------------------------------------- |
| EC2            | VPCs, Subnets, Security Groups, Volumes, Instances | Networks, VPC peering, and database nodes                       |
| KMS            | Keys                                               | Encryption key for EBS volumes                                  |
| SecretsManager | Secret                                             | Database credentials stored here                                |
| S3             | Bucket                                             | Terraform state file for the cluster stored in your AWS account |
| IAM            | Role                                               | IAM role for the pgEdge node EC2 instances                      |
| Route53        | Zones                                              | DNS for the cluster                                             |
