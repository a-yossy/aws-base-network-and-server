terraform {
  backend "s3" {
    bucket       = "base-aws-network-and-server-yossy"
    region       = "ap-northeast-1"
    key          = "terraform.tfstate"
    encrypt      = true
    use_lockfile = true
  }
}
