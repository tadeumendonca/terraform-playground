variable "region" {
  default = "us-east-1"
}

variable "amis" {
  type  = "map"  
  default = {
    "us-east-1" = "ami-b374d5a5",
    "sa-east-1" = "ami-e609d0fb"
  }
}