#==============================================
# Create Application load balancer
#==============================================
resource "aws_lb" "this_load_balancer" {
  name               = var.lb_name
  internal           = var.internal
  load_balancer_type = var.alb_type
  security_groups    = var.alb_sg_ids
  subnets            = var.alb_subnets  

  enable_deletion_protection = false

  tags = {
    name = "ce-alb"
  }
}
