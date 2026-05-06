resource "aws_instance" "website_server" {
  ami                    = "ami-018d49b53eee64386" # Amazon Linux
  instance_type          = "t3.micro"
  key_name               = "chave-site-pro"
  vpc_security_group_ids = [aws_security_group.website_sg.id]
  iam_instance_profile   = "ECR-EC2-Role"

  tags = {
    Name        = "website_server"
    provisioned = "terraform"
    cliente     = "Maria"
  }
}

## Security Group
resource "aws_security_group" "website_sg" {
  name        = "website_sg"
  description = "Security group para website"
  vpc_id      = "vpc-02fb69309d4dc07ed"

  tags = {
    Name        = "website_sg"
    provisioned = "terraform"
    cliente     = "Maria"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.website_sg.id
  cidr_ipv4         = "187.120.11.78/32"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.website_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "allow_https" {
  security_group_id = aws_security_group.website_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.website_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}