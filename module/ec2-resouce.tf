module "ec2-instance" {
  source         = "../module-common"
  security_group = "sg-0dac203017d619736"
  instance_type  = "t3.xlarge"
}