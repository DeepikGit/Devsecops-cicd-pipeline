module "vpc" {
  source     = "./modules/vpc"
  vpc_name   = "onmo-vpc"
  cidr_block = "10.11.0.0/16"

}
module "public_subnet_01" {
  source            = "./modules/public_subnet"
  subnet_name       = "onmo-public-subnet"
  cidr_block        = "10.11.1.0/24"
  availability_zone = "ap-northeast-3a"
  vpc_id            = module.vpc.vpc_id
}

module "private_subnet_01" {
  source            = "./modules/private_subnet"
  private_subnet_name = "onmo-private-subnet"
  cidr_block = "10.11.2.0/24"
  availability_zone = "ap-northeast-3a"
  vpc_id = module.vpc.vpc_id
}
