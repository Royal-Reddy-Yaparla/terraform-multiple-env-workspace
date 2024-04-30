terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
   backend "s3" {
    bucket = "robokart-workspace-lock"
    key    = "multi-env"
    region = "us-east-1"
    dynamodb_table = "terraform-lock-workspace"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}