variable "virginia" {
  default = "us-east-1"
}

variable "ohio" {
  default = "us-east-2"
}

variable "cdirs_block_ssh" {
  type = list

  default = ["179.184.65.86/32"]
}

variable "key_name" {
  default = "terraform-aws"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "db_instance_type" {
  default = "db.t2.micro"
}

variable "amis" {
  type = map

  default = {
      "virginia" = "ami-04b9e92b5572fa0d1"
      "ohio" = "ami-0d5d9d301c853a04a"
  }
}