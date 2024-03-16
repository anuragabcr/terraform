# Create S3 Bucket
resource "aws_s3_bucket" "S3_demo" {
  bucket = "terraform_demo_43234"
}

# Upload file to S3
resource "aws_s3_object" "terraform_index" {
  bucket = aws_s3_bucket.S3_demo.id
  key = "html"
  source = "index.html"
  etag = filemd5("index.html")
}

# S3 Web hosting
resource "aws_s3_bucket_website_configuration" "terraform_hosting" {
  bucket = aws_s3_bucket.name.id

  index_document {
    suffix = "index.html"
  }
}