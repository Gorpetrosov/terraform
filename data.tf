data "aws_vpc" "my_vpc" {
  filter {
    name   = "Name"
    values = ["Something"]
  }
}

data "aws_subnets" "subnet" {
  vpc_id = data.aws_vpc.my_vpc.id
}