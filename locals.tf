locals {
  shared_tags = {
    Automation = "Terraform"
  }
  new_var = "${var.instance_name}-test"
}