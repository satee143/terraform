variable "ami_id" {
  type    = string
  default = "ami-058a8a5ab36292159"
}

variable "instance_type" {
  type    = string
  #default = "t3.micro"
}

variable "ec2-tags" {
  type = map(string)
  default = {
    Name        = "Autosystem-Dev"
    Environment = "Dev"
    Project     = "Autosystem"

  }
}

variable "security_group_name" {
  default = "ec2_security_group"

}

variable "secuirty_group_description" {
  default = "Allow traffic"
}

variable "from_port" {
  type    = number
  default = 22
}

variable "to_port" {
  type    = number
  default = 22
}

variable "protocol" {
  type    = string
  default = "tcp"
}

variable "cidr_blcoks" {
  type    = list(string)
  default = ["0.0.0.0/0"]

}