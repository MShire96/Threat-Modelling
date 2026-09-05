output "threat_vpc_id" {
  value = aws_vpc.threat.id
}

output "subnet_threat_a_id" {
  value = aws_subnet.public_a.id
}

output "subnet_threat_b_id" {
  value = aws_subnet.public_b.id
}