provider "aws" {
  version = "~> 2.0"
  region  = var.ohio
}

resource "aws_instance" "cluster-1" {
  count = 2
  ami = var.amis["ubuntu-18"]
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
      Name = "tf-cl1-${count.index}"
  }
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}", "${aws_default_security_group.default.id}"]
}