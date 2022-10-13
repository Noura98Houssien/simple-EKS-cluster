
locals {
  region = data.aws_region.current.name
}
module "vpc" {
  source                  = "git::https://github.com/terraform-aws-modules/terraform-aws-vpc.git?ref=v3.16.0"
  name                    = var.vpc_name
  cidr                    = var.vpc_cidr
  azs                     = ["${local.region}a", "${local.region}b"]
  public_subnets          = cidrsubnets(var.vpc_cidr, 1, 1)
  enable_dns_hostnames    = true
  enable_dns_support      = true
  map_public_ip_on_launch = true

  tags = {
    Name = var.vpc_name
  }
  public_subnet_tags = {
    Name                                        = "public subnet"
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }


}