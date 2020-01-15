variable "virginia" {
  default = "us-east-1"
}

variable "cdirs_block_ssh" {
  type = list

  default = ["179.184.65.86/32", "187.95.104.95/32"]
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
      "ubuntu-18" = "ami-04b9e92b5572fa0d1"
  }
}