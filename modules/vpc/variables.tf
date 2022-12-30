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
