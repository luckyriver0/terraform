resource "aws_instance" "kpter-front" {
  ami =           "${ var.ami }"
  count =         "${ var.ec2_front["count"] }"
  instance_type = "${ var.ec2_front["instance_type"] }"

  tags {
    Name = "${ var.environment }-kpter-front-${ count.index }"
  }
}
