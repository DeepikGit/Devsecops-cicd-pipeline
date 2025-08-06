output "iam_user_name" {
  value = aws_iam_user.github_ci_user.name
}

output "access_key_id" {
  value     = aws_iam_access_key.github_ci_user_key.id
  sensitive = true
}

output "secret_access_key" {
  value     = aws_iam_access_key.github_ci_user_key.secret
  sensitive = true
}
