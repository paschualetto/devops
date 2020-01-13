output "tf-vg-cl1-0" {
  value = "${aws_instance.vg-cluster-1[0].public_ip}"
}

output "tf-vg-cl1-1" {
  value = "${aws_instance.vg-cluster-1[1].public_ip}"
}

output "tf-oh-cl1-0" {
  value = "${aws_instance.oh-cluster-1[0].public_ip}"
}

output "tf-oh-cl1-1" {
  value = "${aws_instance.oh-cluster-1[1].public_ip}"
}