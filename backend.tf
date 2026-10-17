terraform {
  backend "s3" {
    bucket = "test-tk136"
    key    = "devops/terraform.tfstate"
    region = "us-west-2"
    
  }
}
