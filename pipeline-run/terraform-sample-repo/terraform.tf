terraform {
  backend "s3" {
    bucket         = "tf-validate-project20240418044959943400000001"
    key            = "state/my_ci_cd_pipeline/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}


