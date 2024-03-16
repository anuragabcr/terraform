# S3 public access
resource "aws_s3_bucket_public_access_block" "terraform-demo" {
    bucket = aws_s3_bucket.terraform-demo-43234.id
  block_public_acls = false
  block_public_policy = false
}

# S3 public Read policy
resource "aws_s3_bucket_policy" "open_access" {
  bucket = aws_s3_bucket.terraform-demo-43234.id

  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "Public_access"
    Statement = [
      {
        Sid = "IPAllow"
        Effect = "Allow"
        Principal = "*"
        Action = ["s3:GetObject"]
        Resource = "${aws_s3_bucket.terraform-demo-43234.arn}/*"
      },
    ]
  })
}
