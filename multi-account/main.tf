resource "aws_vpc" "dev" {
  provider = aws.dev
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "roboshop-dev"
  }
}

resource "aws_vpc" "prod" {
  provider = aws.prod
  cidr_block       = "10.1.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "roboshop-prod"
  }
}

# Requestor Side
resource "aws_vpc_peering_connection" "dev_prod" {
  provider = aws.dev 
  peer_owner_id = var.prod # Owner is always acceptor
  peer_vpc_id   = aws_vpc.prod.id # Acceptor
  vpc_id        = aws_vpc.dev.id
  tags = {
    Name = "roboshop-dev-to-prod"
  }
}

resource "aws_vpc_peering_connection_accepter" "peer" {
  provider                  = aws.prod
  vpc_peering_connection_id = aws_vpc_peering_connection.dev_prod.id
  auto_accept               = true

  tags = {
    Name = "roboshop-dev-to-prod"
  }
}