
resource "aws_key_pair" "mykey2" {
  key_name = "mykey2"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}

resource "aws_instance" "web" {
  ami = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  count = 1
  key_name = "${aws_key_pair.mykey2.key_name}"

  tags {
        Name = "web${count.index}"
  }

  provisioner "local-exec" {
     command = "echo ${aws_instance.web.private_ip} >> web_private_ips.txt"                                                                                                                                  xt"
  }

  provisioner "file" {
    source = "script.sh"
    destination = "/tmp/script.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh"
    ]
  }

  connection {
    user = "${var.INSTANCE_USERNAME}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"

  }

}
