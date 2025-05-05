terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version ="5.84.0"
    }
  }
  backend "s3" {
    bucket = "myredbucket2222"
    key="state-info"
    region = "us-east-2"
    dynamodb_table = "myredbucket222"
  }
}

provider "aws" {
  region = "us-east-2"
}