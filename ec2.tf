#SECURITY GROUP
resource "aws_security_group" "my_app_sg" {
  name        = "my_app_sg"
  description = "Allow access to my Server"
  vpc_id      = aws_vpc.main_vpc.id

#INBOUND RULES
  ingress {
    description      = "SSH from my Mac"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["94.11.95.130/32"]
  }
   ingress {
    description      = "SSH from my VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["192.168.0.0/16"]
  }

  tags = {
      Name = "my_app_sg"
  }

  egress {
  description = "Allow access to the world"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
}

data "aws_ami" "my_aws_ami" {
    owners = [ "137112412989" ]
    most_recent = true
    filter {
        name = "name"
        values = [ "amzn2-ami-kernel-*" ]
    }
}
#EC2- PRIVATE
resource "aws_instance" "my_first_server" {
    ami = data.aws_ami.my_aws_ami.id
    instance_type = var.instance_type
    key_name = var.keypair_name 
    subnet_id = aws_subnet.private_a.id
    vpc_security_group_ids = [aws_security_group.my_app_sg.id]

}
#EC2- PUBLIC
resource "aws_instance" "public_server_a" {
  ami = data.aws_ami.my_aws_ami.id
  instance_type = var.instance_type
  key_name = var.keypair_name
  subnet_id = aws_subnet.public_a.id
  vpc_security_group_ids = [aws_security_group.my_app_sg.id]
}

#AMI ID
#INSTANCE TYPE
#KEYPAIR
#SUBNET- PRIVATE
#SECURITY GROUP
#USER-DATA TEMPLATE
#SSH COMMAND
#ssh -i ~/.ssh/<KEY NAME>.pem ec2-user@<IP ADDRESS>
#COPY PRIVATE KEY TO PUBLIC SERVER
#scp -i ~/.ssh/ta-lab-key.pem ~/.ssh/ta-lab-key.pem ec2-user@<PUBLICSERVER>:/home/ec2-user/
