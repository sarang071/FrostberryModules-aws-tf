output "vpc_id"{
    value = aws_vpc.this_vpc.id
}
output "vpc_public_subnets" {
    value = aws_subnet.public_subnet[*].id
  
}
output "vpc_private_subnets" {
    value = aws_subnet.private_subnet[*].id
  
}