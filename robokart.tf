resource "aws_instance" "robokart" {
    ami = data.aws_ami.amazon_linux.id
    instance_type = lookup(var.instance_name,terraform.workspace)
    vpc_security_group_ids = [aws_security_group.practicetf.id]
    tags = {
        Name = "my_intance"
        Terraform = "true"
  }
}

resource "aws_security_group" "practicetf" {
  name        = "practice"
  # description = "Allow TLS inbound traffic and all outbound traffic"
  # vpc_id      = aws_vpc.main.id

  tags = {
    Name = "practice_sg"
  }

  ingress {
    description = "Allow all ports"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    # ipv6_cidr_blocks = ["::/0"]
  }
  
  ingress {
    description = "Allow all ports"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    # ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    # ipv6_cidr_blocks = ["::/0"]
  }
}