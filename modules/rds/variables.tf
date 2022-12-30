variable "subnet_name" {
  type = string
}
variable "subnet_ids" {
  type = list(any)
}
variable "identifier" {
  type = string
}
variable "db_name" {
  type = string
}
variable "engine" {
  type = string
}
variable "engine_version" {
  type = string
}
variable "instance_class" {
  type = string
}
variable "username" {
  type = string
}
variable "rds_sg_groups" {
  type = list(any)
}