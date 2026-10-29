Inventory and settings for the playbook in the [k8s-in-proxmox](https://github.com/m0r4a/k8s-in-proxmox)
submodule (`../k8s-in-proxmox`). Terraform writes the fragments in `inventory.d/`;
`inventory.d/group_vars/` overrides the role defaults.

```bash
ansible-playbook site.yml
```
