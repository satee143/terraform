variable "instance_type" {
  type = list(string)                     # The type of the variable, in this case a string
  default = ["frontend", "backend", "sql"]             # Default value for the variable
  description = "The type of EC2 instance" # Description of what this variable represents
}

variable "project" {
  default = "Expense"
}