terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }
  }
  backend "s3" {
    bucket       = "myterraformbucketdev"
    key          = "state-dev"
    region       = "us-east-2"
    use_lockfile = true

  }
}

provider "aws" {
  region = "us-east-2"
}