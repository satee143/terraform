locals {
  ami_id = data.aws_ami.ami_id.id
  instance_type ="t3.micro"
}