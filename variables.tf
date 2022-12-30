#=============================================
#VPC
#=============================================

variable "vpc_cidr" {
    type = string
}
variable "availability_zone" {
  type = list(string)
}
variable "public_subnet_cidr" {
    type = list(string)
}
variable "private_subnet_cidr" {
    type = list(string)
}
#=============================================
#security groups
#=============================================
variable "alb_security_group_name" {
  type = string
}
variable "alb_sg_ports" {
  type = list(any)
}
#=============================================
#Load balancer
#=============================================
variable "alb_lb_name"{
    type = string
}
variable "alb_internal" {
  type = string
}
variable "alb_type" {
  type = string
}
#=============================================
# Web Ec2 instance
#=============================================
variable "web_ami_id" {
    type = string
}
variable "web_instance_type" {
    type = string
}
variable "web_sg_ports" {
  type = list(any)
}
variable "web_security_group_name" {
  type = string
}
#=============================================
# App Ec2 instance
#=============================================
variable "app_ami_id" {
    type = string
}
variable "app_instance_type" {
    type = string
}
variable "app_sg_ports" {
  type = list(any)
}
variable "app_security_group_name" {
  type = string
}
#=============================================
# SSh Key
#=============================================
variable "key_name" {
    type = string
}
variable "ssh_key_path" {
  type = string
}
#=============================================
# RDS
#=============================================
variable "subnet_name" {
  type = string
}
variable "rds_name" {
  type = string
}
variable "rds_db_name" {
  type = string
}
variable "engine" {
  type = string
}
variable "engine_version" {
  type = string
}
variable "rds_instance_type" {
  type = string
}
variable "username" {
  type = string
}
variable "rds_sg_ports" {
  type = list(any)
}
variable "rds_security_group_name" {
  type = string
}
#=============================================
# S3
#=============================================
variable "bucket_name" {
    type = string
}