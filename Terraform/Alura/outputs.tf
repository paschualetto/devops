output "TF-virginia-0" {
  value = "${aws_instance.server1[0].public_ip}"
}

output "TF-virginia-1" {
  value = "${aws_instance.server1[1].public_ip}"
}

output "TF-ohio-0" {
  value = "${aws_instance.server2[0].public_ip}"
}

output "TF-ohio-1" {
  value = "${aws_instance.server2[1].public_ip}"
}