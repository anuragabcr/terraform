# AWS IAM user
resource "aws_iam_user" "new-user" {
  name = "anu"
  tags = {
    Name = "DevOps"
  }
}