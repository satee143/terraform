resource "aws_security_group" "AllowAll" {
  name="AllowAll"
  description = "Allow Incoming"

}

resource "aws_instance" "Servers" {
  for_each = var.instance_types
  ami="ami-058a8a5ab36292159"
  vpc_security_group_ids = [aws_security_group.AllowAll.id]
  instance_type = each.value

  tags={
    Name=each.key
  }
}

output "instance_type" {
  value = aws_instance.Servers
}