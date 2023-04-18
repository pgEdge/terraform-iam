
variable "role_name" {
  description = "IAM role name"
  type        = string
  default     = "pgedge"
}

variable "random_suffix" {
  description = "Random suffix"
  type        = bool
  default     = true
}

variable "pgedge_account_id" {
  description = "pgEdge account ID"
  type        = string
  default     = "631662578350"
}

variable "external_id" {
  description = "External ID"
  type        = string
}

variable "trusted_principals" {
  description = "Trusted IAM principals"
  type        = list(string)
  default = [
    "arn:aws:iam::631662578350:root"
  ]
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
