terraform {
  backend "s3" {
    bucket = "talent-academy-3550-tfstates"
    key    = "sprint2/basic-vpc/terraform.tfstates"
    dynamodb_table = "terraform-lock"
  }
}