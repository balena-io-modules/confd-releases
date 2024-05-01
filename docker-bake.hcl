variable "CONFD_VERSION" {
  default = "v0.16.0"
}

target "default" {
  platforms = [
    "linux/amd64",
    "linux/arm64",
    "linux/arm/v7",
    "linux/arm/v6"
  ]
  target = "out"
  args = {
    CONFD_VERSION = CONFD_VERSION
  }
}

target "confd-v0-16-0" {
  inherits = ["default"]
  args = {
    CONFD_VERSION = "v0.16.0"
  }
}
