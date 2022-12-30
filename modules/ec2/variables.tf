variable "ami_id" {
    type = string
}
variable "instance_type" {
    type = string
}
variable "public_subnet" {
    type = string
}
variable "sg_ids" {
  type = list(any)
}
variable "pub_key_name" {
  type = string
}