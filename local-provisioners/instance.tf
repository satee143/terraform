resource "aws_vpc" "my_vpc" {
  cidr_block           = "172.16.0.0/16"
  enable_dns_hostnames = true
  instance_tenancy     = "default"
  enable_dns_support   = "true"

  tags = {
    Name = "my vpc"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id                  = "${aws_vpc.my_vpc.id}"
  cidr_block              = "172.16.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "IGW"
  }
}

resource "aws_route_table" "second_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Public Route table"
  }
}

resource "aws_route_table_association" "public_subnet_asso" {

  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.second_rt.id
}


# resource "aws_network_interface" "foo" {
#   subnet_id = "${aws_subnet.my_subnet.id}"
#   private_ips = ["172.16.1.100"]
#
#   tags = {
#     Name = "primary_network_interface"
#   }
# }

resource "aws_security_group" "Allow" {
  name        = "Allow Incoming"
  description = "Allow Incoming traffic"
  vpc_id      = aws_vpc.my_vpc.id
  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "AWS VPC"
  }
}

resource "aws_instance" "JoinDevops" {
  ami                         = "ami-09c813fb71547fc4f"
  vpc_security_group_ids = [aws_security_group.Allow.id]
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.my_subnet.id
  associate_public_ip_address = "true"
  tags = {
    Name = "Aws Instance"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx"
    ]
  }
  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "Devops321"
    host     = self.public_ip
  }
}
