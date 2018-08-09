output "web" {
  value = "${aws_instance.web.*.private_ip}"
}
