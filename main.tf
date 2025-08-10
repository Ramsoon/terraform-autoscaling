

#  Launch Template - Install stress for testing
resource "aws_launch_template" "asg_lt" {
  name_prefix   = "asg-test-lt-"
  image_id      = "ami-0de716d6197524dd9" # Amazon Linux 2
  instance_type = "t3.micro"
  key_name      = var.key_pair_name.key_name

  vpc_security_group_ids = [aws_security_group.asg_sg.id]

  user_data = base64encode(file("${path.module}./bash/install_stres.sh"))


  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "asg-test-instance"
    }
  }
}




