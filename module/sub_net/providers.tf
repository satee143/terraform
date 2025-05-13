terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"}
  }
  backend "s3" {
    bucket       = "vpcbucketforterraform"
    region       = "us-east-2"
    key          = "module-vpc-subnet"
    dynamodb_table = "myredbucket222"
  }
}

provider "aws" {
  region = "us-east-2"
}