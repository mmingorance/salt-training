webserver:
  pkg.installed:
    - name: {{ pillar['pkgs']['apache'] }}
  service.running:
    - name: {{ pillar['pkgs']['apache'] }}
    - require:
      {% if grains['os'] == 'RedHat' %}
        - pkg: httpd
      {% elif grains['os'] == 'Ubuntu' %}
        - pkg: apache2
      {% endif %}

index-html:
  file:
    - managed
    - name: /var/www/html/index.html
    - template: jinja
    - source: salt://webserver/files/jinja_files/index.jinja
    - require:
      - pkg: {{ pillar['pkgs']['apache'] }}
