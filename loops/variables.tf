variable "server_type" {
  type    = list(string)
  default = ["mysql", "frontend", "backend"]
}

variable "hostedzone" {
  default = "devopsguide.in"
}