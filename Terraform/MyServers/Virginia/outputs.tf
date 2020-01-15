/*output "tf-cl1-0" {
  value = "${aws_instance.cluster-1[0].public_ip}"
}

output "tf-cl1-1" {
  value = "${aws_instance.cluster-1[1].public_ip}"
}*/

output "tf-server-images-public-ip" {
  value = "${aws_instance.server-images.public_ip}"
}

output "tf-server-images-public-dns" {
  value = "${aws_instance.server-images.public_dns}"
}

output "jenkins_public_ip" {
  value = "${aws_instance.jenkins.public_ip}"
}

output "jenkins_public_dns" {
  value = "${aws_instance.jenkins.public_dns}"
}