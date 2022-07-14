variable "aws_region" {
  type        = string
  description = ""
  default     = "us-east-1"
}

variable "aws_profile" {
  type        = string
  description = ""
  default     = "paschualetto"
}

variable "instance_ami" {
  type        = string
  description = ""
  default     = "ami-052efd3df9dad4825"
}

variable "instance_type" {
  type        = string
  description = ""
  default     = "t2.micro"
}