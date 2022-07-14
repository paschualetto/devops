variable "environment" {
  type        = string
  description = "The environment type, dev or prod?"
}

variable "aws_region" {
  type        = string
  description = "The aws region where this resource will be created"
}

variable "aws_profile" {
  type        = string
  description = "The aws profile to be used to create the resources"
}

variable "instance_ami" {
  type        = string
  description = "The aws ami to be used in this resource"
}

variable "instance_type" {
  type        = string
  description = "The type (size) of the ec2"
}

variable "instance_tags" {
  type        = map(string)
  description = ""
  default = {
    Name      = "Ubuntu EC2"
    Project   = "Learning Terraform"
    CreatedAt = "13/07/2022"
  }
}