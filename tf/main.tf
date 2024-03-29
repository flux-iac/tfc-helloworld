terraform {
  required_version = ">= 1.1.0"
}

variable "subject" {
   type = string
   default = "World Terraform Cloud"
   description = "Subject to hello"
}

# website::tag::1:: The simplest possible Terraform module: it just outputs "Hello, World!"
output "hello_world" {
  value = "Hello again, ${var.subject}!"
}
