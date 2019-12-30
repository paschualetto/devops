variable "amis" {
  type = map

  default = {
      "us-east-1" = "ami-04b9e92b5572fa0d1"
      "us-east-2" = "ami-0dacb0c129b49f529"
  }
}

variable "cdirs_block_ssh" {
  type = list

  default = ["179.184.65.86/32"]
}

# Type is optional for Strings
variable "key_name" {
  default = "terraform-aws"
}

variable "instance_type" {
  default = "t2.micro"
}
