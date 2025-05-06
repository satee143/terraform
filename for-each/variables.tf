variable "instance_type" {
  default = {
    frontend = "t2.nano"
    backend  = "t2.micro"
    sql      = "t2.small"
  }
}