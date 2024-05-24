# Provider block
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

# resource block
resource "aws_instance" "app_server" {
  count         = 5
  ami           = "ami-007868005aea67c54"
  instance_type = var.ec2_instance_type
  tags = marge(local.shared_tags,{
    Name = upper("${local.new_var}-${count.index}")
  })
  subnet_id = data.aws_subnets.subnet.id
}

resource "aws_s3_bucket" "this" {
  for_each = var.bucket_config
  bucket = lower(each.key)
  tags = each.value["tags"]
}