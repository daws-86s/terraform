resource "aws_instance" "terraform" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.lifecycle.id]
    tags = {
        Name = "lifecycle"
        Terraform = "true"
    }
    /* lifecycle{
      prevent_destroy = true
    } */
}

resource "aws_instance" "another" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    tags = {
        Name = "another"
        Terraform = "true"
    }
    /* lifecycle{
      prevent_destroy = true
    } */
}

resource "aws_security_group" "lifecycle" {
  name   = "lifecycle_change"

  egress {
    from_port        = 0 # from port 0 to to port 0 means all ports
    to_port          = 0 
    protocol         = "-1" # -1 means all protocols
    cidr_blocks      = ["0.0.0.0/0"] # internet
  }

  ingress {
    from_port        = 0 # from port 0 to to port 0 means all ports
    to_port          = 0 
    protocol         = "-1" # -1 means all protocols
    cidr_blocks      = ["0.0.0.0/0"] # internet
  }

  tags = {
    Name = "lifecycle"
  }
  # lifecycle {
  #   create_before_destroy = true
  #   prevent_destroy = true
  # }

}