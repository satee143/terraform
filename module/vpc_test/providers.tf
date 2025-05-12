terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }
  }
  backend "s3" {
    bucket       = "myredbucket2222"
    region       = "us-east-2"
    key          = "module-vpc"
    use_lockfile = true
  }
}

provider "aws" {
  region = "us-east-2"
}