variable "instance_name" {
  description = "value of the Name tag for the EC2 instance"
  type        = string
  default     = "MyNewInstance"
  validation {
    condition = contains([
      "Test"
    ], var.instance_name)
    error_message = "Wrong name"
  }
}

variable "ec2_instance_type" {
  default     = "tc2.micro"
  type        = string
  description = "AWS EC2 instance type."
}

variable "bucket_config" {
  type        = map(any)
  default     = {
    bucket = {
      bucket-1 = {
        tags = {
          Name = "Bucket-1"
          Team = "Front"
        }
      }
      bucket-2 = {
        tags = {
          Name = "Bucket-2"
          Team = "Back"
        }
      }
    }
  }
  description = "anything"
}