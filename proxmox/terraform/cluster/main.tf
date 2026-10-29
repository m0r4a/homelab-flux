module "vm_template" {
  source = "git::https://github.com/m0r4a/k8s-in-proxmox.git//terraform/modules/vm_template?ref=3160254f7bdb1bb462d5899117284f3ef92a35c5"

  proxmox_node    = var.proxmox_node
  template_vm_id  = var.template_vm_id
  vm_user         = var.vm_user
  ssh_public_keys = [trimspace(file(pathexpand(var.ssh_public_key)))]
}

module "k8s_cluster" {
  source = "git::https://github.com/m0r4a/k8s-in-proxmox.git//terraform/modules/k8s_cluster?ref=3160254f7bdb1bb462d5899117284f3ef92a35c5"

  distribution         = "k3s"
  proxmox_node         = var.proxmox_node
  template_vm_id       = module.vm_template.template_vm_id
  vm_user              = var.vm_user
  vm_password          = var.vm_password
  ssh_public_key       = var.ssh_public_key
  ssh_private_key_path = var.ssh_private_key_path
  network_bridge       = var.network_bridge
  network_gateway      = var.network_gateway

  ansible = {
    enabled = true
    path    = "../../ansible"
  }

  nodes = {
    control-plane = {
      vmid   = 201
      role   = "control-plane"
      ip     = "10.0.0.10"
      memory = 3072
      cores  = 2
    }
    worker1 = {
      vmid   = 202
      role   = "worker"
      ip     = "10.0.0.11"
      memory = 4096
      cores  = 3
    }
    worker2 = {
      vmid   = 203
      role   = "worker"
      ip     = "10.0.0.12"
      memory = 4096
      cores  = 3
    }
  }
}
