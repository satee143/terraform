module "vpc" {
  source = "../../module-common/aws-vpc"
  project-name = var.project_name
  environment = var.environment
  cidr_block = var.cidr_block
  common_tags = var.common_tags
  vpc_tags = var.vpc_tags
  igw_tags = var.igw_tags

}