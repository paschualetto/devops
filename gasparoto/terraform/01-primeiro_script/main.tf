terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "paschualetto"
}

resource "aws_s3_bucket" "paschua-test-bucket" {
  bucket = "paschua-test-bucket"

  tags = {
    Name = "Test Bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "private_acl_bucket" {
  bucket = aws_s3_bucket.paschua-test-bucket.id
  acl    = "private"
}