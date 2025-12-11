terraform {
  backend "s3" {
    bucket       = "jamiya-terraform-state-bucket"
    key          = "./.terraform/terraform.tfstate"
    region       = "us-east-1"
    dynamodb_table = "jamiya-terraform-lock-table"
    encrypt      = true 
  }
}