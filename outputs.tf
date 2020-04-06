output "instance_role_name" {
  value       = aws_iam_role.instance.name
  description = "The name of the IAM instance role created"
}

output "instance_role_id" {
  value       = aws_iam_role.instance.id
  description = "The stable and unique string identifying the instance role"
}

output "instance_role_arn" {
  value       = aws_iam_role.instance.arn
  description = "The Amazon Resource Name (ARN) specifying the instance role"
}
