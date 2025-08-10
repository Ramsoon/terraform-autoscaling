variable "awsRegion" {
  default = "us-east-1"
}

#  key
variable "key_pair_name" {
  description = "Existing AWS key pair name to SSH into instances"
  type        = string
  key_name = "my-aws-key"

}
