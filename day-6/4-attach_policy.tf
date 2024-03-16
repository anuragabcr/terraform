# Attach IAM policy with user
resource "aws_iam_policy_attachment" "S3_user" {
    name = "S3_ReadOnly"
  users = [aws_iam_user.new-user.name]
  policy_arn = aws_iam_policy.s3_read.arn
}