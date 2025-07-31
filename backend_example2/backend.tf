terraform {
  backend "s3" {
    bucket = "suran-ise-bucket"
    key    = "tfstates/backend_example2"
    region = "us-west-2"
  }
}
