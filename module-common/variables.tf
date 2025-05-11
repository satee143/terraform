variable "instance_type" {
  type = string                     # The type of the variable, in this case a string
  default = "t2.micro"                 # Default value for the variable
  description = "The type of EC2 instance"# Description of what this variable represents
  validation {
    condition = contains(["t3.small", "t3.large", "t3.mini"], var.instance_type)
    error_message = "Should be one of the t3.small ,t3.large,t3.mini"
  }
}
variable "security_group" {
  type = string                     # The type of the variable, in this case a string
  default = "t2.micro"                 # Default value for the variable
  description = "The type of EC2 instance" # Description of what this variable represents
}