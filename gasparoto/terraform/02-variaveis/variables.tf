variable "environment" {
  type        = string
  description = ""
}

variable "aws_region" {
  type        = string
  description = ""
  #   default     = "us-east-1"
}

variable "aws_profile" {
  type        = string
  description = ""
}

variable "instance_ami" {
  type        = string
  description = ""
  #   default     = "ami-052efd3df9dad4825"
}

variable "instance_type" {
  type        = string
  description = ""
  #   default     = "t2.micro"
}

variable "instance_tags" {
  type        = map(string)
  description = ""
  default = {
    Name    = "Ubuntu EC2"
    Project = "Learn terraform"
  }
}