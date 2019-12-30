variable "virginia" {
  default = "us-east-1"
}

variable "ohio" {
  default = "us-east-2"
}

variable "amis" {
  type = map

  default = {
      "virginia" = "ami-04b9e92b5572fa0d1"
      "ohio" = "ami-0dacb0c129b49f529"
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
