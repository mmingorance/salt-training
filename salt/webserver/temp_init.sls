apache:
  pkg.installed:
    - name: apache2
  service.running:
    - name: apache2
    - require:
        - pkg: apache2

/var/www/html/index.html:
  file:
    - managed
    - source: salt://webserver/files/index.html
    - require:
      - pkg: apache
