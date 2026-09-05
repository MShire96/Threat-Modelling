resource "aws_lb" "threat" {
  name               = "threat-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb.id]
  subnets            = [var.threat_subnet_a_id, var.threat_subnet_b_id]

  enable_deletion_protection = true
}

resource "aws_security_group" "lb" {
  name        = "allow traffic"
  description = "Allow TLS inbound traffic from my ip and all outbound traffic"
  vpc_id      = var.threat_vpc_id

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = var.my_cidr_block
  }

  ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = var.my_cidr_block
  }
}