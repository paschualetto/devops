terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.75.2"
    }
  }

  backend "s3" {}


}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}