terraform {
  backend "s3" {
    bucket = "suran-ise-bucket"
    key    = "tfstates/backend_example"
    region = "us-west-2"
  }
}
