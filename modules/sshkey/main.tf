resource "aws_key_pair" "this_key" {
  key_name   = var.key_name
  public_key = file(var.ssh_pub_key_file_path)
}