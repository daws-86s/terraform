resource "aws_instance" "demo" {
  instance_type = "t3.micro"
  ami           = "ami-09c813fb71547fc4f"
  vpc_security_group_ids = [
    "sg-07c8acf3fa6b923fa"
  ]
  tags = {
    Name = "import-demo-change"
  }
}