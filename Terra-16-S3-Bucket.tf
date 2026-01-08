resource "aws_s3_bucket" "my-s3-bucket" {
  bucket="my-unique-bucket-name-123456"
  tags          = {
    Name = "MyS3Bucket"
    Environment = "Dev"
  }  
  
}
