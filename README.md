andrewrothstein.mkcert
=========
[![Build Status](https://travis-ci.org/andrewrothstein/ansible-mkcert.svg?branch=master)](https://travis-ci.org/andrewrothstein/ansible-mkcert)

Installs [mkcert](https://github.com/FiloSottile/mkcert)

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.mkcert
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
