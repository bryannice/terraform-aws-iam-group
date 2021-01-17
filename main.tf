terraform {
  required_version = ">= 0.14"
}

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

module "iam_group" {
  source = "github.com/bryannice/terraform-aws-module-iam-group//?ref=1.1.0"
  name   = var.group_name
  path   = var.path
}

module "iam_policy_attachment" {
  source     = "github.com/bryannice/terraform-aws-module-iam-group-policy-attachment//?ref=1.0.0"
  group      = module.iam_group.name
  policy_arn = var.policy_arn
}