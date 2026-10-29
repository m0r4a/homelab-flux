Inventory and settings for the playbook in [k8s-in-proxmox](https://github.com/m0r4a/k8s-in-proxmox).
Terraform (`../terraform`) writes the fragments in `inventory.d/`; `inventory.d/group_vars/`
overrides the role defaults.

Run the playbook from a clone of k8s-in-proxmox, checked out at the same commit as the
Terraform `source` refs, with this inventory:

```bash
git clone https://github.com/m0r4a/k8s-in-proxmox.git
git -C k8s-in-proxmox checkout 3160254f7bdb1bb462d5899117284f3ef92a35c5
cd k8s-in-proxmox/ansible
ansible-playbook -i <path-to-this-repo>/proxmox/ansible/inventory.d site.yml
```
