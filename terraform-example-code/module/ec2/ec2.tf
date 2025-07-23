#data source to get ami from aws
data "aws_ami" "my_ami" {
  owners           = ["self"]

  filter {
    name   = "name"
    values = ["yellow-app-image"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

#ec2 in stockholm region
resource "aws_instance" "sample" {
  ami = data.aws_ami.my_ami.id
  instance_type = "t3.micro"
}