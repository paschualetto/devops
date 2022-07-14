terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.75.2"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.3.2"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}