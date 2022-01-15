terraform {
  required_version = ">= 1.1.0"
  cloud {
    organization = "weaveworks"

    workspaces {
      name = "dev"
    }
  }
}

output "hello_world" {
  value = "Hello, World TFC!"
}
