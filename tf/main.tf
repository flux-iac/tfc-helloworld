terraform {
  required_version = ">= 1.1.0"
  cloud {
    organization = "weaveworks"

    workspaces {
      name = "dev"
    }
  }
}

variable "subject" {
   type = string
   default = "World TFC"
   description = "Subject to hello"
}

# website::tag::1:: The simplest possible Terraform module: it just outputs "Hello, World!"
output "hello_world" {
  value = "Hello, ${var.subject}!"
}
