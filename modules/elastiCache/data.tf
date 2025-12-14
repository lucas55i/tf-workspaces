data "aws_security_group" "redis_sg" {
  id = aws_security_group.redis_sg.id
}