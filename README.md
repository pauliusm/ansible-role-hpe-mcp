Ansible role `hpe-mcp`
=========

An Ansible role for installing [HPE MCP](https://downloads.linux.hpe.com/SDR/project/mcp/)

Requirements
------------

CentOS/RHEL 7+ system, with rasdaemon package available.

Role Variables
--------------

`hpe_mcp_packages` - specifies packages to install, defaults to
```
hpe_mcp_packages:
  - hponcfg
  - ssacli
```

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
          when: 'ProLiant' in ansible_product_name
```
Installs MCP repo and `ssacli` package, if `ansible_product_name` contains `Proliant` string.

Testing
-------

[run-docker-tests.sh](tests/run-docker-tests.sh) will help to test role while developing using docker.

License
-------

BSD

Contributors
------------

- [Paulius Mažeika](https://github.com/pauliusm)
