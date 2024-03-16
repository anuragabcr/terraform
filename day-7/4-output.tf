# Website URL
output "website_url" {
  value = aws_s3_bucket.terraform-demo-43234.website_endpoint
}