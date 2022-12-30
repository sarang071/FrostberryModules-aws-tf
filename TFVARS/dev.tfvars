//VPC
vpc_cidr = "10.0.0.0/16"
availability_zone = ["ap-south-1a", "ap-south-1b"]
public_subnet_cidr = ["10.0.0.0/24","10.0.1.0/24"]
private_subnet_cidr = ["10.0.2.0/24","10.0.3.0/24"]

// ALB Security Group
alb_security_group_name = "Frostberry-ALB-SecGrp"
alb_sg_ports = ["80","443"]

//Load balancer
alb_lb_name = "Frostberry-ALB"
alb_internal = "false"
alb_type = "application"

// WebServer EC2
web_security_group_name = "Frostberry-Web-SecGrp"
web_sg_ports = ["80","443"]
web_ami_id = "ami-0cca134ec43cf708f"
web_instance_type = "t2.micro"

// AppServer EC2
app_security_group_name = "Frostberry-App-SecGrp"
app_sg_ports = ["8080","3306"]
app_ami_id = "ami-0cca134ec43cf708f"
app_instance_type = "t2.small"


// SSH Key
key_name = "frostberry-ssh-public-key"
ssh_key_path = "/root/.ssh/id_rsa.pub"

// RDS
subnet_name = "frostberry-rds-subnet"
rds_name = "frostberry-rds"
rds_db_name = "frostberryrds"
engine = "mysql"
engine_version = "5.7"
rds_instance_type = "db.t3.medium"
username = "admin"
rds_sg_ports    = ["3306", "8080"]
rds_security_group_name = "rds-sg"
//S3
bucket_name = "sarang-78951212796"