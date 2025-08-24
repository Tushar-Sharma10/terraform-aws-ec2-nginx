data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}
resource "aws_key_pair" "aws_key" {
  key_name   = "Ec2-key"
  public_key = file("~/.ssh/my-aws-key.pub")

  tags = {
    "Purpose" = "Learning"
  }
}

resource "aws_security_group" "allow_all_traffic" {
  name        = "Ec2_SG"
  description = "This security group refers to the ec2 related rules"
}

resource "aws_vpc_security_group_egress_rule" "outbound_rules" {
  security_group_id = aws_security_group.allow_all_traffic.id
  description       = "This outbound rule allows EC2 to reach to internet on specific port 80"
  ip_protocol       = var.ip_protocol
  from_port         = 80
  to_port           = 80
  cidr_ipv4         = var.cidr_block
}

resource "aws_vpc_security_group_ingress_rule" "inbound_rules" {
  security_group_id = aws_security_group.allow_all_traffic.id
  ip_protocol       = var.ip_protocol
  from_port         = 22
  to_port           = 22
  cidr_ipv4         = var.cidr_block
}

resource "aws_vpc_security_group_ingress_rule" "http_rule" {
  security_group_id = aws_security_group.allow_all_traffic.id
  ip_protocol       = var.ip_protocol
  from_port         = 80
  to_port           = 80
  cidr_ipv4         = var.cidr_block
}



resource "aws_instance" "ec2_instance" {

  ami             = data.aws_ami.ubuntu.id
  instance_type   = var.instance_type
  key_name        = aws_key_pair.aws_key.key_name
  security_groups = [aws_security_group.allow_all_traffic.name]
  user_data       = file("${path.module}/user_data.sh")
  tags = {
    "Name" = "UbuntuEc2"
  }
}