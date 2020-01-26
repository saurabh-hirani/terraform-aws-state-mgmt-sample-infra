terraform {
  backend "s3" {
    bucket         = "sample-app-tf-state-bucket"
    dynamodb_table = "sample-app-tf-lock-table"
  }
}

provider "aws" {
}
