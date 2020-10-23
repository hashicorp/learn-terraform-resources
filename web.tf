resource "random_pet" "name" {}

resource "aws_instance" "web" {
  ami                    = "ami-a0cfeed8"
  instance_type          = "t2.micro"
  user_data              = file("init-script.sh")

  tags = {
    Name = random_pet.name.id
  }
}

output "web-address" {
  value = aws_instance.web.public_dns
}