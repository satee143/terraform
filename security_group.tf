/*resource "aws_instance" "MyFirstVM" {
  ami = "ami-058a8a5ab36292159"
  vpc_security_group_ids = [aws_security_group.AllowAll.id]
}
*/
resource "aws_security_group" "AllowAll" {
  name        = "Allow All"
  description = "Allow SSH"

  tags = {
    Name = "Security_group"
  }
}