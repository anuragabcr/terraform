# Attach IAM policy with user
resource "aws_iam_policy_attachment" "S3_user" {
  name = aws_iam_user.new-user
  policy_arn = aws_iam_policy.s3_read
}