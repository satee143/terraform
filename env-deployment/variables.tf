variable "project" {
  default = "Expense"
}

variable "environment" {}

variable "servers" {
  default = ["frontend","backend","SQL"]
}

variable "ami" {
  default = "ami-058a8a5ab36292159"

}