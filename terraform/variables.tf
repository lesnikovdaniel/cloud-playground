variable "token" {
  type    = string
  default = "y0_AgAAAAArD6_QAATuwQAAAAD3WUIZc5NXVh9mQpu2qZo08R3bYo8KWUw"
}

variable "service_account_key_file" {
  type    = string
  default = "key.json"
}

variable "cloud_id" {
  type    = string
  default = "b1g4bn1u29ngf8rj4iga"
}

variable "folder_id" {
  type    = string
  default = "b1g8ar6d0dnaun4184h0"
}

variable "zone" {
  type    = string
  default = "ru-central1-a"
}

variable "service_account_id" {
  type    = string
  default = "aje6ie42n23247kmeknb"
}

variable "image_id" {
  type    = string
  default = "fd8b88l2b5mnj352lkdk"
}

variable "vpc_network_id" {
  type    = string
  default = "enp0h3kbj4fj21fulo5d"
}
variable "vpc_subnet_a" {
  type    = string
  default = "e2lmi0p9ebfjmk3nfqmf"
}
variable "vpc_subnet_b" {
  type    = string
  default = "e9bcte9c180bm7qqfrb5"
}
variable "vpc_subnet_d" {
  type    = string
  default = "fl8joavkirt6q1i4nv7d"
}

# Declaring variables for user-defined parameters

variable "vm_user" {
  type    = string
  default = "ansible"
}

variable "vm_user_nat" {
  type    = string
  default = "ansible"
}

variable "ssh_key_path" {
  type    = string
  default = "/home/bldfrstr/.ssh/id_rsa.pub"
}


output "compute_instance_nat-instance" {
  value = yandex_compute_instance.nat-instance.network_interface[0].nat_ip_address
}