variable "access_key" {
  type        = string
  default     = ""
  description = "This is the AWS access key. It must be provided, but it can also be sourced from the AWS_ACCESS_KEY_ID environment variable, or via a shared credentials file if profile is specified."
}

variable "bucket" {
  type        = string
  default     = ""
  description = "The name of the bucket. If omitted, Terraform will assign a random, unique name."
}

variable "group_name" {
  default     = ""
  description = "The name of the group."
  type        = string
}

variable "policy_arn" {
  type        = string
  default     = ""
  description = "ARN of the IAM policy."
}

variable "path" {
  default     = "/"
  description = "Path in which to create the group."
  type        = string
}

variable "region" {
  type        = string
  default     = ""
  description = "This is the AWS region. It must be provided, but it can also be sourced from the AWS_DEFAULT_REGION environment variables, or via a shared credentials file if profile is specified."
}

variable "secret_key" {
  type        = string
  default     = ""
  description = "This is the AWS secret key. It must be provided, but it can also be sourced from the AWS_SECRET_ACCESS_KEY environment variable, or via a shared credentials file if profile is specified."
}
