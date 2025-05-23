terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.81.0"
    }
  }
}
resource "aws_vpc" "mainvpc" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  instance_tenancy     = "default"
  tags = merge(var.common_tags, var.vpc_tags,
    { Name = local.resource_name })
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.mainvpc.id
  tags = merge(var.common_tags, var.igw_tags,
    { Name = local.resource_name })
}

resource "aws_subnet" "public_subnet" {
  count = length(var.public_subnet_cidrs)
  vpc_id            = aws_vpc.mainvpc.id
  cidr_block        = var.public_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = merge(var.common_tags, var.public_subnet_tags,
    { Name = local.resource_name })

}