resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.ngw.id
  subnet_id     = aws_subnet.public.id

  tags = {
    "Name" = "main"
  }

  depends_on = [aws_internet_gateway.main]
}
