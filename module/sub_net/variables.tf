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
variable "public_subnet_cidrs" {
  type = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]

}
variable "availability_zones" {
  default = ["us-east-2a", "us-east-2b"]
}

variable "public_subnet_tags" {
  default = { Name = "public-subnet" }
}