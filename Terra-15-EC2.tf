resource "aws_instance" "my_EC2_instance" {
  ami           = "ami-0c55b418827266d8a"
  instance_type = "t2.micro"
    tags          = {
    Name = "MyEC2Instance"
    }
}
