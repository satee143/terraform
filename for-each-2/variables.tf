variable "instance_types"{
  default = {
    frontend ="t2.nano"
    backend ="t2.micro"
    sql="t2.small"
  }
}

variable "domain_name" {
  default = "alibaba.com"
}

variable "zone_id"{
  default = ""
}