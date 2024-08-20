terraform {
  backend "s3" {
    bucket = "suranbucketcs1"
    key    = "tfstates/backend_example"
    region = "us-east-1"
  }
}
