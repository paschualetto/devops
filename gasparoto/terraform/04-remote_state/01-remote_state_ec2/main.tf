terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.75.2"
    }
  }

  backend "s3" {
    # bucket  = "tfstate-807624821827"
    # key     = "learn-terraform/01-remote-state-ec2/terraform.tfstate"
    # region  = "us-east-1"
    # profile = "paschualetto"
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

resource "aws_instance" "ubuntu" {
  ami           = var.instance_ami
  instance_type = var.instance_type

  tags = local.common_tags
}