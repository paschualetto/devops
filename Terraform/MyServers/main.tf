provider "aws" {
  alias = "virginia"
  version = "~> 2.0"
  region  = var.virginia
}

provider "aws" {
  alias = "ohio"
  version = "~> 2.0"
  region  = var.ohio
}

resource "aws_instance" "vg-cluster-1" {
  count = 2
  provider = aws.virginia
  ami = var.amis["virginia"]
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
      Name = "tf-vg-cl1-${count.index}"
  }
  vpc_security_group_ids = ["${aws_security_group.allow_ssh_virginia.id}"]
}

resource "aws_instance" "oh-cluster-1" {
  count = 2
  provider = aws.ohio
  ami = var.amis["ohio"]
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
      Name = "tf-oh-cl1-${count.index}"
  }
  vpc_security_group_ids = ["${aws_security_group.allow_ssh_ohio.id}"]
}