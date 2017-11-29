install_pkg:
  pkg.installed:
    - name: openssh-server

start_service:
  service.running:
    - name: ssh
    - enable: True
    - require:
       - pkg: openssh-server

