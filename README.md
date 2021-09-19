Ansible role `hpe-mcp`
=========

An Ansible role for installing HPE [MCP](https://downloads.linux.hpe.com/SDR/project/mcp/) and
[SPP](https://downloads.linux.hpe.com/SDR/project/spp/): and Management Component Pack and (optionally) Support Pack for ProLiant repos and packages.

Requirements
------------

CentOS/RHEL/Rocky 7+ system.

Role Variables
--------------

`hpe_mcp_packages` - specifies packages to install, defaults to
```
hpe_mcp_packages:
  - hponcfg
  - ssacli
```

`hpe_mcp_spp_packages` - specifies SPP packages to install, defaults to empty array.
If not empty will install SPP repo and listed packages.

If unsupported OS/platform combination found (RHEL8+ and ProLiant gen8 or older), SPP package install will be skipped, even though many RHEL7 packages can be used on RHEL8

Dependencies
------------

None so far.

Example Playbook
----------------

```
    - hosts: all
      roles:
        - role: pauliusm.hpe-mcp
          hpe_mcp_packages:
            - ssacli
          hpe_mcp_spp_packages:
            - fibreutils
          when: "'ProLiant' in ansible_product_name"

```
Installs MCP repo and `ssacli` package, and fibreutils from SPP repo if `ansible_product_name` contains `Proliant` string.

Testing
-------

[run-docker-tests.sh](tests/run-docker-tests.sh) will help to test role while developing using docker.

License
-------

BSD

Contributors
------------

- [Paulius Mažeika](https://github.com/pauliusm)
