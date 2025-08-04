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

module "igw" {
  source = "./modules/igw"
  vpc_id = module.vpc.vpc_id
  name   = "onmo-igw"
}

module "route_table" {
  source = "./modules/route_table"
  vpc_id = module.vpc.vpc_id
  igw_id = module.igw.igw_id
  name   = "onmo-route-table"
}

module "route_table_association_public" {
  source          = "./modules/route_table_association"
  subnet_id       = module.public_subnet_01.subnet_id
  route_table_id  = module.route_table.route_table_id
}

module "security_group" {
  source      = "./modules/security_group"
  name        = "onmo-security-group"
  description = "Security group for onmo application"
  vpc_id      = module.vpc.vpc_id

  ingress_rules = [
    {
      description = "Allow HTTP traffic from anywhere"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    { 
      description = "Allow HTTPS traffic from anywhere"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "Allow SSH traffic from anywhere"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
     {
      description = "Allow tomcat traffic from anywhere"
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
  egress_rules = [
    {
      description = "Allow all outbound traffic"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

module "ec2_web_server" {
  source            = "./modules/ec2_instance"
  name              = var.name
  ami               = var.ami # Replace with a valid AMI ID
  instance_type     = var.instance_type
  subnet_id         = module.public_subnet_01.subnet_id
  vpc_security_group_ids = [module.security_group.sg_id]
  key_name          = var.key_name
  associate_public_ip_address = false
  user_data         = "echo 'Hello, World!' > /var/www/html/index.html" # Example user data script
}

module "ec2_app_server" {
  source            = "./modules/ec2_instance"
  name              = "app-server-docker"
  ami               = "ami-0aafffc426e129572" # Replace with a valid AMI ID
  instance_type     = "t2.micro"
  subnet_id         = module.public_subnet_01.subnet_id
  vpc_security_group_ids = [module.security_group.sg_id]
  key_name          = var.key_name
  associate_public_ip_address = true
  user_data         = file("./scripts/docker-install.sh")
}
