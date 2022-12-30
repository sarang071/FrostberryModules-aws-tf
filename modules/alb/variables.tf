variable "lb_name"{
    type = string
}
variable "internal" {
  type = string
}
variable "alb_type" {
  type = string
}
variable "alb_sg_ids" {
  type = list(string)
}
variable "alb_subnets" {
  type = list(any)
}
