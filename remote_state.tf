terraform {
  backend "s3" {
    bucket = "tf-remote-state"            
    key    = "${var.env}/terraform.tfstate" 
    region = var.aws_region                
    encrypt = true 
  }
}
