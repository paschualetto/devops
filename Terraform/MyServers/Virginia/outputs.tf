/*output "tf-cl1-0" {
  value = "${aws_instance.cluster-1[0].public_ip}"
}

output "tf-cl1-1" {
  value = "${aws_instance.cluster-1[1].public_ip}"
}*/

output "tf-server-images" {
  value = "${aws_instance.server-images.public_ip}"
}