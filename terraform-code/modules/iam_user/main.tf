resource "aws_iam_user" "github_ci_user" {
  name = "github-ci-user"
}

resource "aws_iam_user_policy_attachment" "attach_policy" {
  user       = aws_iam_user.github_ci_user.name
  policy_arn = var.policy_arn
}

resource "aws_iam_access_key" "github_ci_user_key" {
  user = aws_iam_user.github_ci_user.name
}
