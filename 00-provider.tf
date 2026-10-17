terraform {
  backend "s3" {
    bucket = "terrformstate-060647991200"
    key = "infraState/terraform.tfstate"
    region = "us-west-1"
    encrypt = true
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = var.region
}

