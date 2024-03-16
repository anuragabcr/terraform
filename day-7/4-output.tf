# Website URL
output "website_url" {
  value = "http://${aws_s3_bucket.terraform-demo-43234.bucket}.s3-website.${aws_s3_bucket.terraform-demo-43234.region}.amazonaws.com"
}