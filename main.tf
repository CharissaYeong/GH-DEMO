resource "aws_s3_bucket" "ysw_bucket" {
  bucket_prefix = "ysw-bucket-"

  tags = {
    Name        = "GH-DEMO S3 bucket"
    Environment = "demo"
  }
}

resource "aws_s3_bucket_ownership_controls" "ysw_bucket_oc" {
  bucket = aws_s3_bucket.ysw_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "ysw_bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.ysw_bucket_oc]

  bucket = aws_s3_bucket.ysw_bucket.id
  acl    = "private"
}

output "s3_bucket_name" {
  value = aws_s3_bucket.ysw_bucket.bucket
}
