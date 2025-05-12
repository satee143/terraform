variable "project_name" {
  default = "expense"
}
variable "environment" {
  default = "Dev"
}
variable "cidr_block" {
  default = "10.0.0.0/16"
}
variable "common_tags" {
  default = {
    project     = "expense"
    environmnet = "dev"
    terraform   = true
  }
}

variable "vpc_tags" {
  default = {
    purpose = "Assignment"
  }
}

variable "igw_tags" {
  default = {
    purpose = "Assignment"
  }
}