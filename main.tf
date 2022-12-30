// VPC Module
module "Frostberry_VPC" {
    source = "./modules/vpc/"
    vpc_cidr       = var.vpc_cidr
 availability_zone    = var.availability_zone
 public_subnet_cidr   = var.public_subnet_cidr
 private_subnet_cidr  = var.private_subnet_cidr
}

// ALB Security Group
module "Frostberry-ALB-Security-Group" {
    source  = "./modules/sec-grp/"
    vpc_id  = module.Frostberry_VPC.vpc_id
    sg_ports = var.alb_sg_ports
    sg_name = var.alb_security_group_name
}

//Load balancer
module "Frostberry_ALB" {
  source  = "./modules/alb/"
    lb_name = var.alb_lb_name
    internal = var.alb_internal
    alb_type = var.alb_type
    alb_sg_ids = [module.Frostberry-ALB-Security-Group.security_group_id]
    alb_subnets = module.Frostberry_VPC.vpc_public_subnets
}

// Web EC2 Security Group
module "Frostberry-WebServer-Security-Group" {
    source  = "./modules/sec-grp/"
    vpc_id  = module.Frostberry_VPC.vpc_id
    sg_ports = var.web_sg_ports
    sg_name = var.web_security_group_name
}

//Web EC2
module "Frostberry_Web_EC2" {
  source  = "./modules/ec2/"
  ami_id = var.web_ami_id
  instance_type = var.web_instance_type
  public_subnet = module.Frostberry_VPC.vpc_public_subnets[0]
  sg_ids = [module.Frostberry-WebServer-Security-Group.security_group_id]
  pub_key_name = module.frostberry_ssh-public-key.pub_key
}
// App EC2 Security Group
module "Frostberry-AppServer-Security-Group" {
    source  = "./modules/sec-grp/"
    vpc_id  = module.Frostberry_VPC.vpc_id
    sg_ports = var.app_sg_ports
    sg_name = var.app_security_group_name
}

//App EC2
module "Frostberry_App_EC2" {
  source  = "./modules/ec2/"
  ami_id = var.app_ami_id
  instance_type = var.app_instance_type
  public_subnet = module.Frostberry_VPC.vpc_private_subnets[0]
  sg_ids = [module.Frostberry-AppServer-Security-Group.security_group_id]
  pub_key_name = module.frostberry_ssh-public-key.pub_key
}

// SSH Key
module "frostberry_ssh-public-key" {
  source  = "./modules/sshkey/"
  key_name = var.key_name
  ssh_pub_key_file_path = var.ssh_key_path
}

// RDS Security Group
module "Frostberry-RDS-Security-Group" {
    source  = "./modules/sec-grp/"
    vpc_id  = module.Frostberry_VPC.vpc_id
    sg_ports = var.rds_sg_ports
    sg_name = var.rds_security_group_name
}

// RDS
 module "Frostberry_RDS" {
  source = "./modules/rds/"
  subnet_name = var.subnet_name
identifier =  var.rds_name
db_name =    var.rds_db_name
engine = var.engine
engine_version = var.engine_version
instance_class = var.rds_instance_type
username = var.username
subnet_ids =  module.Frostberry_VPC.vpc_private_subnets[*]
rds_sg_groups = [module.Frostberry-RDS-Security-Group.security_group_id]
}

// S3
module "Frostberry_S3-Storage" {
  source = "./modules/s3/"
  bucket_name = var.bucket_name
}