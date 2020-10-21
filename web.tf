resource "random_pet" "sg" {}

resource "aws_instance" "web" {
  ami                    = "ami-a0cfeed8"
  instance_type          = "t2.micro"
  user_data              = file("init-script.sh")
  vpc_security_group_ids = [aws_security_group.web-sg.id]

  tags = {
    Name = random_pet.sg.id
  }
}

output "web-address" {
  value = aws_instance.web.public_dns
}