resource "yandex_compute_instance_group" "kubernetes" {
  name                = "kubernetes-ig"
  folder_id           = var.folder_id
  service_account_id  = var.service_account_id
  deletion_protection = false

  instance_template {
    platform_id = "standard-v1"
    resources {
      memory = 8
      cores  = 4
    }
    boot_disk {
      mode = "READ_WRITE"
      initialize_params {
        image_id = var.image_id
        size     = 15
      }
    }
    network_interface {
      network_id = var.vpc_network_id
      subnet_ids = [var.vpc_subnet_a,var.vpc_subnet_b]
      security_group_ids = [yandex_vpc_security_group.nat-instance-sg.id]
  }
    labels = {
      cluster = "kubernetes"
      stage   = "dev"
    }
    metadata = {
      user-data = "#cloud-config\nusers:\n  - name: ${var.vm_user_nat}\n    groups: sudo\n    shell: /bin/bash\n    sudo: ['ALL=(ALL) NOPASSWD:ALL']\n    ssh-authorized-keys:\n      - ${file("/home/bldfrstr/.ssh/id_rsa.pub")}"
    }
    network_settings {
      type = "STANDARD"
    }
  }

  scale_policy {
    fixed_scale {
      size = 6
    }
  }

  allocation_policy {
    zones = ["ru-central1-a"]
  }

  deploy_policy {
    max_unavailable = 2
    max_creating    = 2
    max_expansion   = 2
    max_deleting    = 2
  }
}
