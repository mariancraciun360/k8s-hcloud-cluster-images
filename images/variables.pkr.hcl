variable "server_location" {
  type        = string
  default     = "fsn1"
  description = "The location of the server"
}

variable "talos_version" {
  type        = string
  description = "The version of Talos Linux to install"
}

variable "talos_schematic_id" {
  type        = string
  description = "The schematic ID of the Talos Linux image"
}
