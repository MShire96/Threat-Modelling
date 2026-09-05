terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket  = "moh-threat-model"
    key     = "tf-state-deploy"
    region  = "us-east-1"
    encrypt = true
  }
}


module "vpc" {
  source          = "./modules/vpc"
  vpc_cidr        = var.vpc_cidr
  subnet_cidr_pua = var.pua
  subnet_cidr_pub = var.pub
}

module "lb" {
  source = "./modules/lb"
  my_cidr_block = var.my_cidr_block
  threat_vpc_id = module.vpc.threat_vpc_id
  threat_subnet_a_id = module.vpc.subnet_threat_a_id
  threat_subnet_b_id = module.vpc.subnet_threat_b_id
}
