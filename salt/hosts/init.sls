/etc/hosts:
  file:
    - managed
    - template: jinja
    - source: salt://hosts/files/hosts.jinja
