variable "cidr_block" {}
variable "enable_dns_hostnames" {
  default = true
}
variable "project-name" {}
variable "environment" {}
variable "common_tags" {}
variable "vpc_tags" {}
variable "igw_tags" {}
variable "public_subnet_cidrs" {}
variable "availability_zones" {

  # validation {
  #   condition = contains(["us-east-2a", "us-east-2b", "us-east-2c"], var.availability_zones)
  #   error_message = "Please choose one of the subnet from the following list 'us-east-2a','us-east-2b','us-east-2c'"
  # }
}

variable "public_subnet_tags" {}