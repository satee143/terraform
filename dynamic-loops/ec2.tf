resource "aws_security_group" "AllowAll" {
  name        = "Allow HTTP & SSH"
  description = "Allow incoming traffic of ssh and HTTP"
  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      from_port   = ingress.value["from_port"]
      to_port     = ingress.value["to_port"]
      protocol    = ingress.value["protocol"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }
}